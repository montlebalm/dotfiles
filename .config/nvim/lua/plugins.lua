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
			"kana/vim-textobj-entire",
		},
	},

	{
		"klen/nvim-config-local",
		opts = {}
	},

	-- Pathing
	{
		'PsychoLlama/further.vim',
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
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		},
	},

	-- Buffers
	-- {
	--   'qpkorr/vim-bufkill',
	--   config = function()
	--     vim.g.BufKillCreateMappings = 0
	--     vim.cmd [[ let g:BufKillCreateMappings = 0 ]]
	--   end
	-- },

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

	-- "gc" to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"suy/vim-context-commentstring",
		},
		opts = {},
	},

	-- References, diagnostics
	{
		"folke/trouble.nvim",
		-- dependencies = {
		--   "nvim-tree/nvim-web-devicons"
		-- },
		config = function()
			require("trouble").setup({
				icons = false,
				fold_open = "-", -- icon used for open folds
				fold_closed = "+", -- icon used for closed folds
				indent_lines = false, -- add an indent guide below the fold icons
				signs = {
					-- icons / text used for a diagnostic
					error = "error",
					warning = "warn",
					hint = "hint",
					information = "info",
				},
				-- Enabling this will use the signs defined in your lsp client
				use_diagnostic_signs = false,
			})

			-- View diagnostics
			vim.keymap.set("n", "<leader>sd", function()
				require("trouble").open("workspace_diagnostics")
			end)
		end,
	},

	-- Formatting
	-- { 'nvimtools/none-ls.nvim' },

	-- View file tree
	-- { 'nvim-tree/nvim-tree.lua' },

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

			-- vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
			vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
		end,
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
