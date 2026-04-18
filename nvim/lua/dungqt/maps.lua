vim.g.mapleader = " "

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Comnpile C++ file
map("n", "<F5>", ":w <bar> !g++ -Wall -g -std=c++17 % -o a.out && ./a.out <CR>")

-- Compile C file
map("n", "<F6>", ":w <bar> !gcc -Wall -g % -o a.out && ./a.out <CR>")

-- Chuyển tab
map("n", "<leader>,", "<Cmd>BufferPrevious<CR>")
map("n", "<leader>.", "<Cmd>BufferNext<CR>")

-- Đóng tab
map("n", "<leader>c", "<Cmd>BufferClose<CR>")

-- Chuyển nhanh theo số
for i = 1, 9 do
  map("n", "<leader>" .. i, "<Cmd>BufferGoto " .. i .. "<CR>")
end

map('n', 'gd', vim.lsp.buf.definition, {})
