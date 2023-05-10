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
    event = { "BufNewFile", "BufReadPre"},
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
    end
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
