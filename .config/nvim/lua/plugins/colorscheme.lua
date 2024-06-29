return {
	{
		"ntk148v/komau.vim",
		enabled = true,
		priority = 1000,
		config = function()
			vim.o.background = "light"
			vim.cmd.colorscheme("komau")

			vim.cmd("hi Normal ctermbg=NONE")

			-- Diagnostic window
			vim.cmd("hi NormalFloat ctermbg=254")

			-- Line separating vertical splits
			vim.cmd("hi WinSeparator ctermbg=254 ctermfg=254")

			vim.cmd("hi link WarningMsg Normal")

			-- vim.cmd("hi Visual ctermbg=223")
			-- vim.cmd("hi Visual ctermbg=214")
			-- vim.cmd("hi Visual ctermbg=114")
			-- vim.cmd("hi Visual ctermbg=222")
			-- vim.cmd("hi Visual ctermbg=151")
			vim.cmd("hi Visual ctermbg=175")

			-- Strip italic
			vim.cmd("hi Identifier cterm=NONE")

			-- Functions
			--   const foo = useMemo(...)
			--               ^^^^^^^
			--   obj.method()
			--       ^^^^^^
			vim.cmd("hi link @lsp.type.function.typescriptreact Special")
			vim.cmd("hi link @function.method.call.tsx Special")

			-- TSX tags
			--   <div />
			--    ^^^
			vim.cmd("hi link @tag.tsx Identifier")
			vim.cmd("hi link @tag.builtin.tsx Identifier")
		end,
	},

	-- {
	-- 	"chriskempson/base16-vim",
	-- 	enabled = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.o.background = "dark"
	-- 		vim.cmd.colorscheme("base16-grayscale-dark")
	--
	-- 		vim.cmd("hi SignColumn ctermbg=NONE")
	-- 		vim.cmd("hi GitGutterAdd ctermbg=NONE")
	-- 		vim.cmd("hi GitGutterChange ctermbg=NONE")
	-- 		vim.cmd("hi GitGutterDelete ctermbg=NONE")
	-- 	end,
	-- },

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
