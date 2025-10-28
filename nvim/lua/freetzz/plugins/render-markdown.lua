return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    heading = {
      icons = { "①  ", "②  ", "③  ", "④  ", "⑤  ", "⑥  " }, -- Unicode circled numbers
      -- backgrounds = {
      --   "RenderMarkdownH3Bg",
      --   "RenderMarkdownH6Bg",
      --   "RenderMarkdownH5Bg",
      --   "RenderMarkdownH4Bg",
      --   "RenderMarkdownH2Bg",
      --   "RenderMarkdownH1Bg",
      -- },
      -- foregrounds = {
      --   "RenderMarkdownH3",
      --   "RenderMarkdownH6",
      --   "RenderMarkdownH5",
      --   "RenderMarkdownH4",
      --   "RenderMarkdownH2",
      --   "RenderMarkdownH1",
      -- },
    },
    checkbox = {
      enabled = true,
      position = "inline",
      unchecked = {
        icon = "✖",
        highlight = "RenderMarkdownUnchecked",
        scope_highlight = nil,
      },
      checked = {
        icon = "✔",
        highlight = "RenderMarkdownChecked",
        scope_highlight = "@markup.strikethrough",
      },
      custom = {
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
      },
    },
    bullet = { icons = { { "•", "⚬", "⋄", "‣" } } },
    sign = { enabled = false },
  },
}
