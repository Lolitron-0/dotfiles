local M = {}

function M.on_attach(client, bufnr)
  -- enable completion triggered by <C-x><C-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>td", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  -- vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
  vim.keymap.set("n", "<space>do", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "gl", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set("n", "<space>dl", vim.diagnostic.setloclist, bufopts)
  vim.keymap.set("n", "<S-M-f>", vim.lsp.buf.format, bufopts)

  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format() end
    })
  end

  -- code lens
  if client.server_capabilities.code_lens then
    local codelens = vim.api.nvim_create_augroup(
      'LSPCodeLens',
      { clear = true }
    )
    vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
      group = codelens,
      callback = function()
        vim.lsp.codelens.refresh()
      end,
      buffer = bufnr,
    })
  end

  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, {})
    end
  })
end

function M.ocamllsp_setup()
  local status, lsp = pcall(require, "lspconfig")
  if (not status) then return end

  lsp.ocamllsp.setup({
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    on_attach = M.on_attach,
    capabilities = require "cmp_nvim_lsp".default_capabilities()
  })
end

function M.clangd_setup()
  local status, lsp = pcall(require, "lspconfig")
  if (not status) then return end

  lsp.clangd.setup({
    on_attach = M.on_attach,
    capabilities = require "cmp_nvim_lsp".default_capabilities()
  })
end

function M.luals_setup()
  vim.lsp.config('lua_ls', {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
            path ~= vim.fn.stdpath('config')
            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        workspace = {
          checkThirdParty = false,
          -- library = {
          --   vim.env.VIMRUNTIME
          -- }
          library = {
            vim.api.nvim_get_runtime_file('', true),
          }
        }
      })
    end,
    settings = {
      Lua = {}
    },
    on_attach = M.on_attach,
    capabilities = require "cmp_nvim_lsp".default_capabilities()
  })
end

function M.setup()
  vim.diagnostic.config {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      severity_sort = true,
      severity = vim.diagnostic.severity.HINT
    }
  }

  vim.lsp.enable('ocamllsp')
  vim.lsp.enable('clangd')
  vim.lsp.enable('lua_ls')

  local c = vim.lsp.protocol.make_client_capabilities()
  c.textDocument.completion.completionItem.snippetSupport = true
  c.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }

  M.ocamllsp_setup()
  M.clangd_setup()
  M.luals_setup()
end

return M
