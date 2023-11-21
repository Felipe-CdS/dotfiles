local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
	"tsx"
  },
   cli_options = {
	arrow_parens = "always",
	bracket_spacing = true,
	bracket_same_line = false,
	embedded_language_formatting = "auto",
	end_of_line = "lf",
	html_whitespace_sensitivity = "css",
	jsx_single_quote = false,
	print_width = 100,
	prose_wrap = "preserve",
	quote_props = "as-needed",
	semi = true,
	single_attribute_per_line = false,
	single_quote = false,
	trailing_comma = "es5",
	tab_width = 40,
	use_tabs = true,
  }
})
