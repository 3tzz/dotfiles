vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>ss", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sS", "<C-w>s", { desc = "Split window horizontaly" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width" })
keymap.set("n", "<leader>sw", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>tt", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tw", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tk", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tj", ":tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Spelling
keymap.set("n", "<leader>zx", "<cmd>set spell<cr>", { desc = "Spell check on text" })
keymap.set("n", "<leader>zX", "<cmd>set nospell<cr>", { desc = "Spell check off text" })
keymap.set("n", "<leader>zg", "zg", { desc = "Add to dictionary", noremap = true, silent = true }) -- add a word to the custom dictionary (default: zg)
keymap.set("n", "<leader>zd", "zug", { desc = "Remove from dictionary", noremap = true, silent = true }) -- remove a word from the dictionary (default: zug)
keymap.set("n", "<leader>zz", "z=", { desc = "Suggestions", noremap = true, silent = true }) -- show spelling suggestions (default: z=)
keymap.set("n", "<leader>zn", "]s", { desc = "Next misspelled word", noremap = true, silent = true }) -- jump to the next misspelled word (default: ]s)
keymap.set("n", "<leader>zN", "[s", { desc = "Previous misspelled word", noremap = true, silent = true }) -- jump to the previous misspelled word (default: [s)

-- Save co
keymap.set({ "n", "i", "v", "x" }, "<C-s>", "<cmd>:w<cr>", { desc = "Save file." })
