local M = {}

---@class carbon.Highlight
---@field fg string? color name or "#RRGGBB", see note.
---@field bg string? color name or "#RRGGBB", see note.
---@field sp string? color name or "#RRGGBB"
---@field blend integer? between 0 and 100
---@field bold boolean?
---@field standout boolean?
---@field underline boolean?
---@field undercurl boolean?
---@field underdouble boolean?
---@field underdotted boolean?
---@field underdashed boolean?
---@field strikethrough boolean?
---@field italic boolean?
---@field reverse boolean?
---@field nocombine boolean?
---@field link string? name of another highlight group to link to, see `:hi-link`.
---@field default string? Don't override existing definition `:hi-default`
---@field ctermfg string? Sets foreground of cterm color `ctermfg`
---@field ctermbg string? Sets background of cterm color `ctermbg`
---@field cterm string? cterm attribute map, like `highlight-args`. If not set, cterm attributes will match those from the attribute map documented above.
---@field force boolean? if true force update the highlight group when it exists.

---@class carbon.Colors
---@field foreground string?
---@field background string?
---@field background_float string?
---@field background_statusline string?
---@field green string?
---@field yellow string?
---@field orange string?
---@field red string?
---@field magenta string?
---@field pink string?
---@field lavender string?
---@field blue string?
---@field sky string?
---@field cyan string?
---@field teal string?
---@field white string?
---@field gray string?
---@field black string?
---@field accent string?
---@field highlight string?
---@field brackets string?

---@class carbon.Config.italics
---@field comments boolean?
---@field code boolean?
---@field virtual_text boolean?

---@class carbon.Config.diagnostics
---@field darker boolean?
---@field background boolean?

---@class carbon.Config.overrides
---@field colors carbon.Colors?
---@field highlights table<string, carbon.Highlight>?

---@class carbon.Config
---@field italics carbon.Config.italics?
---@field diagnostics carbon.Config.diagnostics?
---@field overrides carbon.Config.overrides?

local config
local colors
local highlights

local hl = require("carbon.highlights")

---@param opts carbon.Config?
function M.setup(opts)
	config = vim.tbl_deep_extend("force", require("carbon.config").default(), opts or {})
	colors = vim.tbl_deep_extend("force", require("carbon.colors").colors(), config.overrides.colors)

	highlights = hl.highlights(colors, config)
	if type(colors["@overrides"]) == "function" then
		highlights = vim.tbl_extend("force", highlights, colors["@overrides"]())
	end
	highlights = vim.tbl_extend("force", highlights, config.overrides.highlights)
end

function M.load()
	if config == nil then
		M.setup()
	end

	vim.cmd("hi clear")

	vim.o.background = "dark"
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "carbon"

	hl.bulk_hi(highlights)
end

---@return carbon.Colors colors
function M.get_colors()
	return vim.deepcopy(colors, true)
end

return M
