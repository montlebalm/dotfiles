--
-- Neovim Default (Light)
--

vim.o.background = "light"

vim.cmd([[
	hi Visual ctermbg=11 ctermfg=0 guibg=#ffd75f

	hi! PmenuSel cterm=NONE ctermbg=0 ctermfg=11

	hi Search ctermbg=11 ctermfg=0
	hi! link CurSearch Search
]])

return {
	{
		"montlebalm/komau.vim",
		dir = "~/Developer/montlebalm/komau.vim",
		dev = true,
		enabled = false,
		priority = 1000,
		config = function()
			vim.o.background = "light"
			vim.cmd.colorscheme("komau")
		end,
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
}
