local M = {}

M.autoformat = false

function M.format(opts)
	local buf = vim.api.nvim_get_current_buf()
	-- if vim.b.autoformat == false and not (opts and opts.force) then
	--   return
	-- end
	local ft = vim.bo[buf].filetype
	local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

	vim.lsp.buf.format(vim.tbl_deep_extend("force", {
		bufnr = buf,
		filter = function(client)
			if have_nls then
				return client.name == "null-ls"
			else
				return client.name ~= "null-ls"
			end
		end,
	}, {}))
end

function M.on_attach(client, buf)
	-- if
	--   client.config
	--   and client.config.capabilities
	--   and client.config.capabilities.documentFormattingProvider == false
	-- then
	--   return
	-- end

	if client.supports_method("textDocument/formating") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormat." .. buf, {}),
			buffer = buf,
			callback = function()
				if M.autoformat then
					M.format()
				end
			end,
		})
	end
end

return M
