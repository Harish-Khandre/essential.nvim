return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "[F]ind files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[L]ive grep files" })
			vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[Find] current [W]ord" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
			vim.keymap.set("n", "<leader>gI", builtin.lsp_implementations, { desc = "[G]o to [I]mplementation" })
			vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "[G]o to [D]efinitions" })
			vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "[G]o to [R]eferences" })
			vim.keymap.set(
				"n",
				"<leader>sf",
				"<cmd>Telescope session-lens search_session<cr>",
				{ desc = "[S]ession find" }
			)
			vim.keymap.set(
				"n",
				"<leader>,",
				"<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
				{ desc = "[S]witch buffer" }
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
