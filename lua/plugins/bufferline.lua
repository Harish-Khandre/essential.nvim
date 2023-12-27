return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "[T]oggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "[D]elete non-pinned buffers" },
			{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "[D]elete other buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "[D]elete buffers to the right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "[D]elete buffers to the left" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "[P]rev buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "[N]ext buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "[P]rev buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "[N]ext buffer" },
		},
		opts = {
			options = {},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd("BufAdd", {
				callback = function() end,
			})
		end,
	},
}
