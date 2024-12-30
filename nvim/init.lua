-- [[ Initial Setting configs ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.relativenumber = true

vim.opt.guicursor = ""

vim.opt.breakindent = false
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false

-- Save undo history inside undodir
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.colorcolumn = "100"

-- Set pallete based on the terminal colors
vim.opt.termguicolors = false

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.isfname:append("@-@")

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 500

-- [[ Keymaps ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center cursor when moving up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- open new tmux sessio
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- copy to system clipboard
vim.keymap.set("v", "<leader>c", "\"+y")

-- lsp code action
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- [[ Auto Commands ]]

-- Format Tailwind Classes on templ file
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.templ" },
	callback = function()
		local bufPath = vim.fn.expand("%")
		local cmd = "terminal cat  " .. bufPath .. "| templ fmt | rustywind --write " .. bufPath

		local job = vim.fn.jobstart(cmd, {
			on_exit = function()
				vim.cmd('checktime')
			end,
		})

		vim.fn.jobwait({ job })
	end
})

-- Format Tailwind Classes on templ file
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.html" },
	callback = function()
		local bufPath = vim.fn.expand("%")
		local cmd = "terminal cat  " .. bufPath .. "| rustywind --write " .. bufPath

		local job = vim.fn.jobstart(cmd, {
			on_exit = function()
				vim.cmd('checktime')
			end,
		})

		vim.fn.jobwait({ job })
	end
})
