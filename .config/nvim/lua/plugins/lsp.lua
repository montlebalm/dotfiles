return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Useful status updates for LSP
		{ "j-hui/fidget.nvim", opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		{ "folke/neodev.nvim", opts = {} },

		{ "antosha417/nvim-lsp-file-operations", opts = {} },
	},

	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		--
		-- Keymaps
		--

		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "gR", function()
				require("trouble").open("lsp_references")
			end)
			vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

			vim.keymap.set("n", "<leader>af", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>ap", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<leader>an", vim.diagnostic.goto_next, opts)
		end

		--
		-- Servers
		--

		local servers = {
			bashls = {},
			cssls = {},
			eslint = {
				format = false,
			},
			graphql = {},
			html = {},
			jsonls = {},
			lua_ls = {
				Lua = {
					diagnostics = {
						-- Recognize "vim" global
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
			stylelint_lsp = {},
			svelte = {},
			tsserver = {
				-- 8192, 16384, 32768, 65536
				['typescript.tsserver.maxTsServerMemory'] = 32768,
				['typescript.tsserver.log'] = 'verbose',
			},
			vimls = {},
		}

		local lspconfig = require("lspconfig")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		require("mason").setup({})

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = lsp_capabilities,
						settings = servers[server_name],
						on_attach = on_attach,
					})
				end,
			},
		})

		--
		-- Diagnostics
		--

		-- Diagnostic icons
		local signs = {
			Error = "•",
			Warn = "◦",
			Hint = "?",
			Info = "ⁱ",
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- Diagnostic text
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = false,
		})

		-- You will likely want to reduce updatetime which affects CursorHold
		-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#show-line-diagnostics-automatically-in-hover-window
		vim.o.updatetime = 250
		vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
	end,
}
