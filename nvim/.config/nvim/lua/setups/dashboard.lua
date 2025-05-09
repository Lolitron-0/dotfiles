return { setup = function ()
      local db = require('dashboard')
      local height = vim.api.nvim_win_get_height(0)

      local dashboard_custom_header13 = {
        ' ⡿⠉⠄⠄⠄⠄⠈⠙⠿⠟⠛⠉⠉⠉⠄⠄⠄⠈⠉⠉⠉⠛⠛⠻⢿⣿⣿⣿⣿⣿ ',
        ' ⠁⠄⠄⠄⢀⡴⣋⣵⣮⠇⡀⠄⠄⠄⠄⠄⠄⢀⠄⠄⠄⡀⠄⠄⠄⠈⠛⠿⠋⠉ ',
        ' ⠄⠄⠄⢠⣯⣾⣿⡿⣳⡟⣰⣿⣠⣂⡀⢀⠄⢸⡄⠄⢀⣈⢆⣱⣤⡀⢄⠄⠄⠄ ',
        ' ⠄⠄⠄⣼⣿⣿⡟⣹⡿⣸⣿⢳⣿⣿⣿⣿⣴⣾⢻⣆⣿⣿⣯⢿⣿⣿⣷⣧⣀⣤ ',
        ' ⠄⠄⣼⡟⣿⠏⢀⣿⣇⣿⣏⣿⣿⣿⣿⣿⣿⣿⢸⡇⣿⣿⣿⣟⣿⣿⣿⣿⣏⠋ ',
        ' ⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿⠄ ',
        ' ⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏⠄ ',
        ' ⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄⠄ ',
        ' ⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂⠄ ',
        ' ⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄⠄ ',
        ' ⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄⠄ ',
        ' ⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄⠄ ',
        ' ⣿⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⡟⢀⠃⠄⢸⡄⠁⣸ ',
        ' ⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄⣿ ',
        ' ⡟⠄⠄⠄⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣟⣻⣩⣾⣃⣴⣿⣿⡇⠸⢾ ',
        '',
      }

      local iconGroup = "Constant"
      local descGroup = "Comment"
      local keyGroup = "ModeMsg"

      local res = {

        theme = 'doom',
        config = {
          header = dashboard_custom_header13,
          center = {
            {
              icon = ' ',
              icon_hl = iconGroup,
              desc = 'Projects                            ',
              desc_hl = descGroup,
              key = 'p',
              key_hl = keyGroup,
              key_format = ' %s',
              action = "Telescope project"
            },
            {
              icon = ' ',
              icon_hl = iconGroup,
              desc = 'Sessions',
              desc_hl = descGroup,
              key = 's',
              key_hl = keyGroup,
              key_format = ' %s',
              action = "Telescope session-lens search_session"
            },
            {
              icon = ' ',
              icon_hl = iconGroup,
              desc = 'Recent files',
              desc_hl = descGroup,
              key = 'r',
              key_hl = keyGroup,
              key_format = ' %s',
              action = "Telescope recent_files pick"
            },
            {
              icon = ' ',
              icon_hl = iconGroup,
              desc = 'File browser',
              desc_hl = descGroup,
              key = 'f',
              key_hl = keyGroup,
              key_format = ' %s',
              action = "Telescope file_browser"
            },
            {
              icon = ' ',
              icon_hl = iconGroup,
              desc = 'Change colorscheme',
              desc_hl = descGroup,
              key = 'C',
              key_hl = keyGroup,
              key_format = ' %s',
              action = "Telescope colorscheme"
            },
            {
              icon = ' ',
              icon_hl = iconGroup,
              desc = 'Configure nvim',
              desc_hl = descGroup,
              key = 'c',
              key_hl = keyGroup,
              key_format = ' %s',
              action = "e ~/dotfiles/configs/nvim"
            },
          },
          footer = { "", "👁 私の想像力はどこにあるのか 👁" }
        }
      }

      local line_count = #res.config.header + #res.config.center * 2 + #res.config.footer;
      local height_offset = (vim.api.nvim_win_get_height(0) - line_count) / 2;
      for i = 0, height_offset+1 do
        table.insert(res.config.header, 1, "")
      end

      db.setup(res)
      vim.cmd [[hi link DashboardHeader String]]
      -- vim.cmd [[hi DashboardHeader ctermfg=13 guifg=magenta]]
      --vim.cmd [[hi link DashboardFooter String]]
      --vim.cmd [[hi DashboardFooter ctermfg=13 guifg=magenta]]
      vim.cmd [[hi DashboardIcon ctermfg=8 guifg=darkgrey]]
      vim.cmd [[hi DashboardDesc ctermfg=8 guifg=darkgrey]]
      vim.cmd [[hi DashboardKey cterm=bold ctermfg=lightcyan gui=bold guifg=lightcyan]]
end

}
