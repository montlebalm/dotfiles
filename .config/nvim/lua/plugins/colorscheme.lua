return {
	{
		"montlebalm/vim-greyscale",
		-- dir = "~/Development/me/vim-greyscale",
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("greyscale")
		end,
	},

	{
		-- 'rose-pine/neovim',
		"montlebalm/rose-pine-neovim",
		enabled = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				bold_vert_split = true,
				dim_nc_background = true,
				disable_background = true,
				highlight_groups = {
					StatusLine = { bg = "highlight_low", fg = "subtle" },
					User1 = { bg = "highlight_low", fg = "subtle" },
					["@tag.attribute.tsx"] = { fg = "subtle" },
					LazyDimmed = { fg = "subtle" },
					Pmenu = { bg = "highlight_med" },
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},

	{
		"rainglow/vim",
		enabled = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("stealth")
			-- vim.cmd.colorscheme("stealth-contrast")
			-- vim.cmd.colorscheme("hive-contrast")
			-- vim.cmd.colorscheme("arstotzka")
			-- vim.cmd.colorscheme("absent-contrast")

			vim.cmd("hi Normal guibg=NONE")
			vim.cmd("hi SignColumn guibg=NONE")
		end,
	},

	{
		"chriskempson/base16-vim",
		enabled = true,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("base16-grayscale-dark")

			vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
			vim.cmd("hi SignColumn ctermbg=NONE guibg=NONE")

			vim.cmd("hi Comment ctermfg=10")

			-- Statusline
			vim.cmd("hi Statusline ctermbg=10")
			vim.cmd("hi User1 ctermbg=11")

			-- Highlights
			vim.cmd("hi Visual ctermfg=0 ctermbg=13")
			vim.cmd("hi Search ctermfg=0 ctermbg=13")

			-- Import keywords
			--   import { foo } from 'bar'
			--   ^^^^^^
			vim.cmd("hi Include ctermfg=8")

			-- TSX property names
			--   <div foo="bar" />
			--        ^^^
			vim.cmd("hi Tag ctermfg=8")

			-- Variables
			--   const foo = 1
			--         ^^^
			vim.cmd("hi Identifier ctermfg=13")
		end,
	},
}
