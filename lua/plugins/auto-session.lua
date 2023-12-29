return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_session_enable_last_session = true,
			auto_restore_enabled = true,
			auto_save_enabled = true,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

		local keymap = vim.keymap
		keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = " [S]ession restore" })
		keymap.set("n", "<leader>sd", "<cmd>Autosession delete<CR>", { desc = " [S]ession delete" })
		keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "[S]ession save" })
	end,
}
