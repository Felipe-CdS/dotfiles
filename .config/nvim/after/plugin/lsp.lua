require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = {"lua_ls", "tsserver", "rust_analyzer"},
	automatic_installation = true,
}
local lsp = require('lsp-zero')

lsp.preset("recommended")

require('lspconfig').tsserver.setup({})
require('lspconfig').rust_analyzer.setup({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.set_sign_icons({ })

lsp.setup()
