return {
	{
		"montlebalm/komau.vim",
		dir = "~/Development/montlebalm/komau.vim",
		dev = true,
		enabled = true,
		priority = 1000,
		config = function()
			vim.o.background = "light"
			vim.cmd.colorscheme("komau")
		end,
	},

	{
		"horanmustaplot/xcarbon.nvim",
		enabled = false,
		lazy = false,  -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd("colorscheme xcarbon")
		end,
	},

	{
		'olivercederborg/poimandres.nvim',
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require('poimandres').setup({})
		end,

		-- optionally set the colorscheme within lazy config
		init = function()
			vim.cmd("colorscheme poimandres")
		end
	},

	{
		'rose-pine/neovim',
		enabled = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				styles = {
					bold = false,
					italic = false,
					transparency = false,
				},
				variant = 'dawn',
			})

			vim.o.background = "light"
			vim.cmd.colorscheme("rose-pine")

			vim.cmd("hi Normal guibg=NONE")

			vim.cmd("hi Comment guifg=#bbb4ac")

			vim.cmd("hi Statusline guibg=#f3ddd7")
			vim.cmd("hi WinSeparator guifg=#f3ddd7 guibg=#f3ddd7")
			-- vim.cmd("hi NormalFloat guibg=#f3ddd7")
		end,
	},

	{
		"chriskempson/base16-vim",
		enabled = false,
		priority = 1000,
		config = function()
			vim.o.background = "light"
			vim.cmd.colorscheme("base16-grayscale-light")

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
			vim.cmd("hi @tag.attribute.tsx ctermfg=8")

			-- Variables
			--   const foo = 1
			--         ^^^
			vim.cmd("hi Identifier ctermfg=13")
		end,
	},
}
