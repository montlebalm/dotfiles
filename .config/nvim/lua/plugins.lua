return {
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Change surround characters
	"tpope/vim-surround",

	-- Text objects
	{
		"kana/vim-textobj-user",
		dependencies = {
			"glts/vim-textobj-comment",
			"kana/vim-textobj-entire",
			"kana/vim-textobj-indent",
		},
	},

	{
		"klen/nvim-config-local",
		opts = {}
	},

	{
		'mhinz/vim-startify',
		enabled = false,
		config = function()
			vim.cmd([[
				" returns all modified files of the current git repo
				" `2>/dev/null` makes the command fail quietly, so that when we are not
				" in a git repo, the list will be empty
				function! s:gitModified()
					let files = systemlist('git ls-files -m 2>/dev/null')
					return map(files, "{'line': v:val, 'path': v:val}")
				endfunction

				" same as above, but show untracked files, honouring .gitignore
				function! s:gitUntracked()
					let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
					return map(files, "{'line': v:val, 'path': v:val}")
				endfunction

				let g:startify_lists = [
					\ { 'type': 'files',     'header': ['   MRU']            },
					\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
					\ { 'type': 'sessions',  'header': ['   Sessions']       },
					\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
					\ { 'type': function('s:gitModified'),  'header': ['   git modified']},
					\ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
					\ { 'type': 'commands',  'header': ['   Commands']       },
					\ ]

				  " https://www.asciiart.eu/text-to-ascii-art
					" let g:startify_custom_header = [
					" 	\ '   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
					" 	\ '   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
					" 	\ '   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
					" 	\ '   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
					" 	\ '   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
					" 	\ '   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
					" 	\ ]
					let g:startify_custom_header = [
						\ '    ██████   █████                                ███                 ',
						\ '   ░░██████ ░░███                                ░░░                  ',
						\ '    ░███░███ ░███   ██████   ██████  █████ █████ ████  █████████████  ',
						\ '    ░███░░███░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ',
						\ '    ░███ ░░██████ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ',
						\ '    ░███  ░░█████ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ',
						\ '    █████  ░░█████░░██████ ░░██████   ░░█████    █████ █████░███ █████',
						\ '   ░░░░░    ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ',
						\ ]
				]])
		end
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				json = { "prettier" },
				lua = { "stylua" },
				-- JavaScript and friends
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = true,
			},
		},
	},

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim", opts = {} },

	-- Adds git releated signs to the gutter (and utils)
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				attach_to_untracked = false,
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "<leader>hn", gs.next_hunk)
					map("n", "<leader>hp", gs.next_hunk)

					-- Actions
					map("n", "<leader>hu", gs.undo_stage_hunk)
					map("n", "<leader>hs", gs.stage_hunk)
					map("n", "<leader>hr", gs.reset_hunk)

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
				end,
			})

			-- Highlights
			vim.cmd("hi DiffChange ctermbg=NONE")
		end,
	},

	{
		'sindrets/diffview.nvim',
		config = function()
			require('diffview').setup({
				use_icons = false,
			})
		end,
	},

	-- "gc" to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"suy/vim-context-commentstring",
		},
		opts = {},
	},

	-- Automatically create missing directories
	"duggiefresh/vim-easydir",

	-- Github Copilot
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_filetypes = {
				TelescopePrompt = false,
			}

			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""

			vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
	},

	-- Reload browser
	{
		"montlebalm/vim-reload-browser",
		config = function()
			vim.g.reload_browser_chrome = 1
			-- vim.g.reload_browser_firefox = 1
			-- vim.g.reload_browser_safari = 1
			-- vim.g.reload_browser_safari_tech_preview = 1

			vim.keymap.set("n", "<leader>rs", ":call ReloadBrowser()<cr>", { silent = true, noremap = true })
		end,
	},
}
