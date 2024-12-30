local M = {}

function M.ConfigLSP()
	require('mason').setup()
	require('mason-lspconfig').setup {
		ensure_installed = { "lua_ls", "rust_analyzer", "gopls", "templ", "tailwindcss", "html", "zls" },
		automatic_installation = true,
	}
	local lsp = require('lsp-zero')

	lsp.preset("recommended")

	require('lspconfig').lua_ls.setup({
		settings = {
			Lua = { diagnostics = { globals = { 'vim' } } }
		}
	})

	require('lspconfig').zls.setup({ settings = {} })


	-- require('lspconfig').rust_analyzer.setup({})

	require('lspconfig').templ.setup({
		cmd = { "templ", "lsp" },
		filetypes = { "templ" },
	})

	require 'lspconfig'.eslint.setup({
		settings = {
			packageManager = 'yarn'
		},
		on_attach = function(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				command = "EslintFixAll",
			})
		end,
	})

	-- require('lspconfig').tailwindcss.setup({
	-- 	filetypes = { "templ", "astro", "javascript", "typescript", "react" },
	-- 	init_options = { userLanguages = { templ = "html" } },
	-- })

	require('lspconfig').gopls.setup({
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		settings = {
			gopls = {
				["build.templateExtensions"] = { "tmpl" },
				completeUnimported = true,
				analyses = {
					shadow = true,
					nilness = true,
					unusedresult = true,
					unusedparams = true,
					unusedwrite = true,
					useany = true,
					unreachable = true,
				},
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
				staticcheck = true,
			}
		}
	})

	require('lspconfig').html.setup({
		filetypes = { "html" },
	})

	lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({ buffer = bufnr })
	end)

	lsp.set_sign_icons({})

	lsp.setup()
end

return M
