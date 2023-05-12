return {
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = require("plugins.config.luasnip").opts,
		keys = require("plugins.config.luasnip").keys,
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = require("plugins.config.lsp").config,
		dependencies = require("plugins.config.lsp").dependencies,
		opts = require("plugins.config.lsp").opts,
	},

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = require("plugins.config.nvim-cmp").opts,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = "TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		keys = require("plugins.config.treesitter").keys,
		opts = require("plugins.config.treesitter").opts,
		config = require("plugins.config.treesitter").config,
	},

	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "mason.nvim" },
		event = { "BufNewFile", "BufReadPre" },
		opts = function()
			local null_ls = require("null-ls")
			return {
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.completion.spell,
				},
			}
		end,
	},

	-- debug
	{
		"mfussenegger/nvim-dap",

		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
      -- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
      },
				opts = {},
				config = function(_, opts)
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup(opts)
					dap.set_log_level("TRACE")
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open({})
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close({})
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close({})
					end
					dap.adapters.python = {
						type = "executable",
						command = "/usr/bin/python",
						args = { "-m", "debugpy.adapter" },
					}
					dap.configurations.python = {
						{
							type = "python",
							request = "launch",
							name = "launch file",
							program = "${file}",
							pythonPath = function()
								return "/usr/bin/python"
							end,
						},
					}
				end,
			},
			-- virtual text for the debugger
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
		},
		keys = require("plugins.config.dap").keys,
		config = require("plugins.config.dap").config,
	},

	-- auto pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},

	-- surround
	{
		"echasnovski/mini.surround",
		lazy = false,
		event = { "BufReadPre" },
		keys = require("plugins.config.surround").kyes,
		opts = require("plugins.config.surround").opts,
		config = require("plugins.config.surround").config,
	},

	-- comments
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = require("plugins.config.comment").opts,
		config = require("plugins.config.comment").config,
	},
}
