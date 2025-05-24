local M = {}

---@return carbon.Config
function M.default()
	return {
		italics = {
			comments = true,
			code = false,
			virtual_text = false,
		},
		diagnostics = {
			darker = true,
			background = false,
		},
		overrides = {
			colors = {},
			highlights = {},
		},
	}
end

return M
