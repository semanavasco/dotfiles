-- Enabling numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enabling mouse control
vim.o.mouse = "a"

-- Don't show the current mode
vim.o.showmode = false

-- Enable clipboard sync
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Highlight current line
vim.o.cursorline = true

-- Lines to keep above/below the cursor
vim.o.scrolloff = 10

-- Ask for confirmation when unsaved changes in the buffer
vim.o.confirm = true
