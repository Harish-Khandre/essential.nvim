return {
	"rmagatti/auto-session",
	config = function()
		local function close_neo_tree()
			require("neo-tree.sources.manager").close_all()
			vim.notify("closed all")
		end

		local function open_neo_tree()
			vim.notify("opening neotree")
			require("neo-tree.sources.manager").show("filesystem")
		end
		local auto_session = require("auto-session")
		auto_session.setup({
			auto_session_enable_last_session = true,
			auto_restore_enabled = true,
			auto_save_enabled = true,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
			bypass_session_save_file_types = { "neo-tree" },
			pre_save_cmds = {
				close_neo_tree,
			},
			post_restore_cmds = {
				open_neo_tree,
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session" })
		keymap.set("n", "<leader>sd", "<cmd>Autosession delete<CR>", { desc = "Delete session" })
		keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session" })
	end,
}
