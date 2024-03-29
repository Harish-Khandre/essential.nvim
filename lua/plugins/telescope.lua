return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"build",
						"dist",
						"yarn.lock",
						".git",
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "[F]ind files" })
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find word" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume search" })
			vim.keymap.set("n", "<leader>gI", builtin.lsp_implementations, { desc = "Implementation" })
			vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Definitions" })
			vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "References" })
			vim.keymap.set("n", "<leader>ic", builtin.colorscheme, { desc = "Color scheme" })
			vim.keymap.set("n", "<leader>cs", builtin.spell_suggest, { desc = "Spell suggest" })
			vim.keymap.set(
				"n",
				"<leader>fc",
				"<cmd>Telescope grep_string<cr>",
				{ desc = "Find string under cursor in cwd" }
			)
			vim.keymap.set(
				"n",
				"<leader>,",
				"<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
				{ desc = "[,] Switch buffer" }
			)
			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
