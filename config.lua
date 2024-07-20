-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Editor configuration
vim.colorscheme = "catppuccin"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = true
vim.opt.relativenumber = true

lvim.builtin.indentlines.active = false

lvim.plugins = {
  { "mfussenegger/nvim-jdtls" },
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        styles = {
          comments = { "italic" },
        },
        default_integrations = true
      })
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "nord"
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        }
      })
    end
  },
  {
    "olexsmir/gopher.nvim"
  },
  {
    "leoluz/nvim-dap-go"
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,
      keywords = {
        TODO = { icon = "👻", color = "warning" },
        PERF = { icon = "🚀", color = "info" },
      },
      highlight = {
        comments_only = true,
      }
    }
  }
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls", "gopls" })

lvim.builtin.treesitter.ensure_installed = { "java", "go", "gomod" }
