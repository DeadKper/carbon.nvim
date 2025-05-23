---@class carbon.Config.italics
---@field comments boolean?
---@field code boolean?
---@field virtual_text boolean?

---@class carbon.Config.diagnostics
---@field darker boolean?
---@field background boolean?

---@class carbon.Config.overrides
---@field colors carbon.Colors
---@field highlights table?

---@class carbon.Config
---@field italics carbon.Config.italics?
---@field diagnostics carbon.Config.diagnostics?
---@field overrides carbon.Config.overrides?

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
