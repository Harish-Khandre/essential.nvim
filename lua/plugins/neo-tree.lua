return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle<CR>", { desc = "[E]xplorer" })
		require("neo-tree").setup({
			-- open_files_in_place = true,
			theme = "catppuccin",
			window = {
				width = 30,
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
				filtered_items = {
					hide_dotfiles = true,
					hide_gitignored = true,
					hide_by_name = {
						"README.md",
					},
					always_show = {
						".env",
					},
				},
			},
		})
	end,
}
