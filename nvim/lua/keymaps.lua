-- Pressing <Esc> clears highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Pressing J-K exits insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Setting window management keybinds
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Splits window vertically." })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Splits window horizontally." })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Makes the splits equal size." })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Closes the current split." })

-- Setting tab management keybinds
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Opens a new tab." })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Closes the current tab." })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Goes to the next tab." })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Goes to the previous tab." })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Opens the current buffer in a new tab." })
