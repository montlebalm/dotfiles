return {
	"nvim-telescope/telescope.nvim",

	branch = "0.1.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},

	config = function()
		local telescope = require("telescope")
		local telescope_actions = require("telescope.actions")
		local telescope_builtin = require("telescope.builtin")
		local telescope_fb = require("telescope._extensions.file_browser.actions")

		telescope.setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					height = {
						padding = 0,
					},
					width = {
						padding = 0,
					},
					prompt_position = "bottom",
				},
				mappings = {
					i = {
						["<C-j>"] = telescope_actions.move_selection_next,
						["<C-k>"] = telescope_actions.move_selection_previous,
						-- ["<Down>"] = telescope_actions.move_selection_next,
						-- ["<Up>"] = telescope_actions.move_selection_previous,
						-- ["<s-Down>"] = telescope_actions.cycle_history_next,
						-- ["<s-Up>"] = telescope_actions.cycle_history_prev,
						["<Down>"] = telescope_actions.cycle_history_next,
						["<Up>"] = telescope_actions.cycle_history_prev,
						-- ["<C-q>"] = telescope_trouble.open,
					},
				},
			},
			pickers = {
				buffers = {
					ignore_current_buffer = true,
					sort_mru = true,
				},
				find_files = {
					path_display = { "smart" },
				},
			},
			extensions = {
				file_browser = {
					dir_icon = ">",
					hijack_netrw = true,
					mappings = {
						["n"] = {
							["-"] = telescope_fb.goto_parent_dir,
						},
					},
				},
			},
		})

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "file_browser")
		-- pcall(telescope.load_extension, "harpoon")

		--
		-- Keymaps
		--

		vim.keymap.set("n", "<leader>b", telescope_builtin.buffers, { desc = "Find [B]uffers" })
		vim.keymap.set("n", "<leader>p", telescope_builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>f", telescope_builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set(
			"n",
			"<leader>g",
			telescope.extensions.live_grep_args.live_grep_args,
			{ desc = "[S]earch by [G]rep" }
		)
		vim.keymap.set("n", "<leader>d", telescope_builtin.git_status, { desc = "[S]earch by [G]it" })

		vim.keymap.set("n", "<leader>td", telescope_builtin.lsp_document_symbols, { desc = "[S]earch [S]ymbols" })

		-- vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, { desc = "[S]earch [H]elp" })
		-- vim.keymap.set("n", "<leader>sw", telescope_builtin.grep_string, { desc = "[S]earch current [W]ord" })
		-- vim.keymap.set('n', '<leader>sd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

		vim.keymap.set("n", "<leader>k", ":Telescope file_browser path=%:p:h select_buffer=true<CR><esc>")

		-- vim.keymap.set("n", "<leader>h", ":Telescope harpoon marks<cr>")
	end,
}
