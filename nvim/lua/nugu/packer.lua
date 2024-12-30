vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
	function(use)
		use {
			'wbthomason/packer.nvim'
		}

		-- use {
		-- 	'rose-pine/neovim',
		-- 	as = 'rose-pine',
		-- 	priority = 1000,
		-- 	config = function()
		-- 		vim.cmd.colorscheme "rose-pine"
		-- 	end
		-- }

		use {
			'nvim-telescope/telescope.nvim',
			requires = {
				{ 'nvim-lua/plenary.nvim' }
			},
			config = function()
				local builtin = require('telescope.builtin')

				vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
				vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
				vim.keymap.set('n', '<leader>ps', function()
					builtin.grep_string({ search = vim.fn.input("Grep > ") });
				end)
			end
		}

		use {
			'nvim-treesitter/nvim-treesitter',
			config = function()
				require('nvim-treesitter.configs').setup({
					ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "go" },
					sync_install = false,
					auto_install = true,
					highlight = {
						enable = true,
						additional_vim_regex_highlighting = false,
					},
				})
			end
		}

		use {
			'theprimeagen/harpoon',
			requires = {
				{ 'nvim-lua/plenary.nvim' }
			},
			config = function()
				local mark = require("harpoon.mark")
				local ui = require("harpoon.ui")

				vim.keymap.set("n", "<leader>a", mark.add_file)
				vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

				vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
				vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
				vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
				vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
			end
		}

		use {
			'mbbill/undotree',
			config = function()
				vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)
			end
		}

		-- "gc" to comment visual regions/lines
		use {
			'numToStr/Comment.nvim',
			opts = {},
			config = function()
				require('Comment').setup()
			end
		}

		use {
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x',
			requires = {
				{ 'williamboman/mason.nvim' },
				{ 'williamboman/mason-lspconfig.nvim' },

				{ 'neovim/nvim-lspconfig' },
				{ 'hrsh7th/nvim-cmp' },
				{ 'hrsh7th/cmp-nvim-lsp' },
				{ 'L3MON4D3/LuaSnip' },
			},
			config = function()
				local c = require("nugu.lsp_config")
				c.ConfigLSP()
			end
		}

		use {
			'stevearc/conform.nvim',
			config = function()
				local c = require("conform")

				c.setup({
					formatters_by_ft = {
						lua = { "stylua" },
						javascript = { { "prettierd", "prettier" } },
						go = { "gofmt" },
					},
					format_on_save = {
						timeout_ms = 500,
						lsp_format = "fallback",
					},
				})

				vim.keymap.set('n', '<leader>f',
					function() c.format({ async = true, lsp_fallback = true }) end)
			end
		}
	end
)
