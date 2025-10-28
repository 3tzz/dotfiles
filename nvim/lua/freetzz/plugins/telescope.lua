return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            -- ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            -- ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    local keymap = vim.keymap

    -- Add individual keymaps
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

    -- Markdown
    keymap.set("n", "<leader>mn", "<cmd>RenderMarkdown toggle<cr>", { desc = "Render" })
    keymap.set("n", "<leader>mm", "<cmd>MarkdownPreview<cr>", { desc = "Preview" })
    keymap.set("n", "<leader>md", "<cmd>RenderMarkdown debug<cr>", { desc = "Debug marks" })
    -- TODO: maybe marks are interesting
    -- TODO: check stay-centere

    -- Spell check
    keymap.set("n", "<leader>cd", "<cmd>CocDiagnostics<cr>", { desc = "Spell check diagnostics" })
    keymap.set("n", "<leader>cw", "<cmd>CocDisable<cr>", { desc = "Spell check off code" })

    local wk = require("which-key")
    ---@diagnostic disable-next-line: deprecated, missing-fields
    wk.register({ prefix = "<leader>" }, {
      w = { name = "Sessions" },
      s = { name = "Windows" },
      t = { name = "Tabs" },
      f = { name = "Fuzzy Telescope" },
      e = { name = "File Explorer", icon = "" },
      h = { name = "Git" },
      r = { name = "Replace", icon = "󱩾" },
      g = { name = "Lsp", icon = "" },
      x = { name = "Trouble", icon = "󱏚" },
      l = { name = "Linter", icon = "⚑" },
      n = { name = "Formater" },
      m = { name = "Markdown" },
      v = { name = "Visual", icon = "☕" },
      c = { name = "Spell checker Code", icon = "♿" },
      z = { name = "Spel checker Vim", icon = "♿" },
    })
  end,
}
