---@module 'lazy'
---@type LazySpec
return {
  'nvim-mini/mini.pairs',
  version = false,
  event = { 'InsertEnter', 'CmdlineEnter' }, -- lazy load on entering insert mode and cmdline
  opts = { modes = { insert = true, command = true, terminal = false } },
  config = function(_, opts)
    local pairs = require('mini.pairs')
    pairs.setup(opts)

    -- monkey patch mini.pairs.open function based on LazyVim mini.pairs custom config
    -- see https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/mini.lua
    -- and https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/coding.lua
    local open = pairs.open
    pairs.open = function(pair, neigh_pattern) ---@diagnostic disable-line: duplicate-set-field
      if vim.fn.getcmdline() ~= '' then
        return open(pair, neigh_pattern)
      end

      local opening, closing = pair:sub(1, 1), pair:sub(2, 2)
      local line = vim.api.nvim_get_current_line()
      local cursor = vim.api.nvim_win_get_cursor(0)
      local before = line:sub(1, cursor[2])
      local next = line:sub(cursor[2] + 1, cursor[2] + 1)

      -- better deal with markdown code blocks
      if opening == '`' and vim.bo.filetype == 'markdown' and before:match('^%s*``') then
        return '`\n```' .. vim.api.nvim_replace_termcodes('<up>', true, true, true)
      end

      -- skip autopair when the cursor is inside these treesitter nodes
      local skip_ts = { 'string', 'comment' }
      if skip_ts and #skip_ts > 0 then
        local ok, captures = pcall(vim.treesitter.get_captures_at_pos, 0, cursor[1] - 1, math.max(cursor[2] - 1, 0))
        for _, capture in ipairs(ok and captures or {}) do
          if vim.tbl_contains(skip_ts, capture.capture) then
            return opening
          end
        end
      end

      -- skip autopair if the next character is one of these
      if next ~= '' and next:match([=[[%w%%%'%[%"%.%`%$]]=]) then
        return opening
      end

      -- skip autopair if the next character is closing and there are more closing than opening characters
      if next == closing and closing ~= opening then
        local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), '')
        local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), '')
        if count_close > count_open then
          return opening
        end
      end

      return open(pair, neigh_pattern)
    end
  end,
}
