return {
  setup = function()
    local actions = require("telescope.actions")
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
      },
      extensions = {
        coc = {
          prefer_locations = true,
          push_cursor_on_edit = true,
          timeout = 3000,
        }
      },
    }

    require('telescope').load_extension('glyph')
    require('telescope').load_extension('file_browser')
    require("telescope").load_extension("emoji")
    require("telescope").load_extension("recent_files")
    require('telescope').load_extension('project')
    require('telescope').load_extension('session-lens')
    require('telescope').load_extension('coc')

    local builtin = require('telescope.builtin')
    local extensions = require('telescope').extensions

    vim.keymap.set('n', '<space>f', ":Telescope find_files<cr>", {})
    vim.keymap.set('n', '<space>g', builtin.live_grep, {})
    vim.keymap.set('n', '<space>h', builtin.help_tags, {})
    vim.keymap.set('n', '<space>r', function() extensions.coc.references {} end, {})
    vim.keymap.set('n', '<space>s', function() extensions.coc.workspace_symbols {} end, {})
    vim.keymap.set('n', '<space>c', function() extensions.coc.document_symbols {} end, {})
  end
}
