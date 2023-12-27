return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "biome", "tailwindcss", "prismals", "html", "eslint", "cssls", "sqlls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.biome.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.prismals.setup({})
			lspconfig.html.setup({})
			lspconfig.eslint.setup({})
			lspconfig.cssls.setup({})
			lspconfig.sqlls.setup({})

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]o to declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "[D]etails" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[G]o to implementations" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode Action" })
		end,
	},
}
