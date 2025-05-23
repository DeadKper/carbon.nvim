local M = {}
local util = require("carbon.util")

local set_hl = vim.api.nvim_set_hl

function M.hi(...)
	set_hl(0, ...)
end

local hi = M.hi

function M.bulk_hi(highlights)
	for group, properties in pairs(highlights) do
		hi(group, properties)
	end
end

---@param colors carbon.Colors
---@param opts carbon.Config
---@return table<string, table<string, string>>
function M.highlights(colors, opts)
	local dark_fg = util.darken(colors.foreground, 0.1)
	return {
		Normal = { fg = colors.foreground, bg = colors.background },
		NormalFloat = { fg = colors.foreground, bg = colors.background_float },

		StatusLine = { fg = colors.foreground, bg = colors.statusline_background },
		StatusLineTerm = { fg = colors.foreground, bg = colors.background },
		StatusLineNC = { fg = dark_fg, bg = colors.background },
		StatusLineTermNC = { fg = dark_fg, bg = colors.background },
	}
end

return M
