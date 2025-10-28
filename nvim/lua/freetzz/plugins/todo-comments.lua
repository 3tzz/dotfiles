return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>x]", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "<leader>x[", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
}
-- use shift colon to shine !!!
-- TODO INIT unfinished code or planned features
-- TODO INIT unfinished code or planned features
-- FIXME INIT issue in the code that needs attention later
-- FIX  INIT aforementioned ^
-- BUG INIT confirmed issue that affects functionality
-- HACK INIT when you use some workaround and know the implementation is not ideal and may need to be revisited
-- WARN INIT potential risk in the code or in future code
-- WARNING INIT aforementioned ^
-- NOTE INIT give additional context
-- INFO INIT aforementioned ^
-- OPTIMIZE INIT efficiency of this code can be improved
-- OPTIM INIT aforementioned ^
-- PERF INIT fully optimized!
-- PERFORMANCE INIT aforementioned ^
-- TEST INIT code need tests
-- PASSED INIT confirms that works properly after testing
-- FAILED INIT in some case fail and expose bugs
