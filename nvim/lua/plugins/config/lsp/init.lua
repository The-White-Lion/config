local M = {}

M.dependencies = {
	{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
	"mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"hrsh7th/cmp-nvim-lsp",
		cond = function()
			return require("lazy.core.config").plugins["nvim-cmp"] ~= nil
		end,
	},
}

M.opts = {
	diagnostics = {
		underline = true,
		update_in_insert = false,
		virtual_text = {
			spacing = 4,
			source = "if_many",
			prefix = icons.ui.Prefix,
		},
		severity_sort = true,
	},
	capabilities = {},
	autoformat = true,
	-- format options can find in :h vim.lsp.buf.format
	format = {
		formatting_options = nil,
		timeout_ms = nil,
	},

	-- LSP Server Settings
	servers = {
		bashls = {},
		clangd = {},
		gopls = {},
		golangci_lint_ls = {},
		jsonls = {},
		lua_ls = {},
		pyright = {},
	},
}

function M.config(_, opts)
	-- setup autoformat
	require("plugins.config.lsp.format").autoformat = opts.autoformat
	-- setup formatting and keymaps
	require("util").on_attach(function(client, buffer)
		require("plugins.config.lsp.format").on_attach(client, buffer)
		require("plugins.config.lsp.keymaps").on_attach(client, buffer)
	end)

	-- sidebar diagnostics icons
	local function set_sidebar_icons()
		local icon_names = {
			Error = icons.diagnostics.BoldError,
			Warn = icons.diagnostics.BoldWarning,
			Info = icons.diagnostics.BoldInfo,
			Hint = icons.diagnostics.BoldHint,
		}
		for type, icon in pairs(icon_names) do
			local name = "DiagnosticSign" .. type
			vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
		end
	end

	set_sidebar_icons()
	vim.lsp.set_log_level("debug")
	vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

	local servers = opts.servers
	local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	local capabilities = vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		has_cmp and cmp_nvim_lsp.default_capabilities() or {},
		opts.capabilities or {}
	)
	local function setup(server)
		local server_opts = vim.tbl_deep_extend("force", {
			capabilities = vim.deepcopy(capabilities),
		}, servers[server] or {})
		require("lspconfig")[server].setup(server_opts)
	end

	local have_mason, mlsp = pcall(require, "mason-lspconfig")
	local ensure_installed = vim.tbl_keys(servers)

	if have_mason then
		mlsp.setup({ ensure_installed = ensure_installed })
		mlsp.setup_handlers({ setup })
	end
end

return M
