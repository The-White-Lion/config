return {
	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	-- indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		lazy = false,
		opts = {
			char = icons.ui.LineMiddle,
			filetype_exclude = { "hlep", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_current_context = false,
			show_trailing_blankline_indent = false,
		},
	},

	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		version = false,
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		opts = {
			symbol = icons.ui.LineMiddle,
		},
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = require("plugins.config.lualine").opts,
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = require("plugins.config.bufferline").opts,
	},

	-- lsp symbol navigation
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		init = function()
			require("util").on_attach(function(client, buffer)
				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, buffer)
				end
			end)
		end,
		opts = function()
			return {
				separator = " " .. icons.ui.ChevronRight .. " ",
				highlight = true,
				depth_limit = 5,
				icons = icons.kind,
			}
		end,
	},

	-- dashboard
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = require("plugins.config.alpha").opts,
		config = require("plugins.config.alpha").config,
	},

	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- ui component
	{ "MunifTanjim/nui.nvim", lazy = true },
}
