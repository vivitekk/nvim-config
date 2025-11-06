return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
  dependencies = {
    {
      -- lsp notification UI
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            normal_hl = 'Normal',
            winblend = 0,
          },
        },
      },
    },
    'mason-org/mason-lspconfig.nvim',
  },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- rename the variable under the cursor
        map('<leader>rn', vim.lsp.buf.rename, 'rename')

        -- execute a code action
        map('<leader>ca', vim.lsp.buf.code_action, 'code action', { 'n', 'x' })

        -- go to declaration
        map('<leader>gD', vim.lsp.buf.declaration, 'go to declaration')

        -- go to definition
        map('<leader>gd', vim.lsp.buf.definition, 'go to definition')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
            end,
          })
        end

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    vim.diagnostic.config({
      severity_sort = true,
      underline = false,
      float = { source = false },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '\u{F530} ',
          [vim.diagnostic.severity.WARN] = '\u{F071} ',
          [vim.diagnostic.severity.INFO] = '\u{F449} ',
          [vim.diagnostic.severity.HINT] = '\u{F400} ',
        },
      },
      virtual_text = {
        source = false,
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    })

    local lspconfig = require 'lspconfig'
    local capabilities = require('blink-cmp').get_lsp_capabilities()

    require('mason-lspconfig').setup({
      handlers = {
        -- default handler for every installed server
        function(server_name)
          lspconfig[server_name].setup({ capabilities = capabilities })
        end,
      },
    })

    -- extend specific configs
    vim.lsp.config('lua_ls', {
      settings = { Lua = { completion = { callSnippet = 'Replace' } } },
    })
  end,
}
