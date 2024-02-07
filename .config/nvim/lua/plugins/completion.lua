return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},

	config = function()
		require("luasnip.loaders.from_vscode").lazy_load({
			paths = { "./luasnips" },
		})

		local luasnip = require("luasnip")
		local cmp = require("cmp")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			sources = {
				{ name = "path" },
				{ name = "buffer" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete({}),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand() then
						luasnip.expand()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})
	end,
}
