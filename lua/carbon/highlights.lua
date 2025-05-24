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
---@return table<string, carbon.Highlight>
function M.highlights(colors, opts)
	---@type table<string, carbon.Highlight>
	local hl = {
		Normal = { fg = colors.foreground, bg = colors.background },
		NormalFloat = { fg = colors.foreground, bg = colors.background_float },
		Title = { link = "NormalFloat" },
		Terminal = { link = "Normal" },

		StatusLine = { fg = colors.foreground, bg = colors.background_statusline },
		StatusLineTerm = { link = "StatusLine" },
		StatusLineNC = { fg = colors.gray, bg = colors.background },
		StatusLineTermNC = { link = "StatusLineNC" },

		CurSearch = { fg = colors.black, bg = colors.accent },
		IncSearch = { fg = colors.black, bg = colors.accent },
		Search = { fg = colors.black, bg = colors.accent },

		Comment = { fg = colors.gray, italic = true },

		Constant = { fg = colors.teal },
		String = { fg = colors.lavender },
		Character = { fg = colors.pink },
		Number = { fg = colors.cyan },
		Boolean = { link = "Number" },
		Float = { link = "Number" },

		Identifier = { link = "Normal" },
		Function = { fg = colors.pink },

		Statement = { link = "Keyword" },
		Conditional = { link = "Keyword" },
		Repeat = { link = "Keyword" },
		Label = { link = "Keyword" },
		Operator = { fg = colors.foreground },
		Keyword = { fg = colors.blue },
		Exception = { link = "Keyword" },

		PreProc = { fg = colors.magenta },
		Include = { link = "PreProc" },
		Define = { link = "PreProc" },
		Macro = { link = "PreProc" },
		PreCondit = { link = "PreProc" },

		Type = { fg = colors.magenta },
		StorageClass = { link = "Type" },
		Structure = { link = "Type" },
		Typedef = { link = "Type" },

		Special = { fg = colors.magenta },
		SpecialChar = { link = "Special" },
		Tag = { fg = colors.lavender },
		Delimiter = { fg = colors.brackets },
		SpecialComment = { fg = colors.gray, italic = true },
		Debug = { fg = colors.lavender },

		Underlined = { fg = colors.sky, underline = true },

		Error = { link = "Keyword", undercurl = true, sp = colors.magenta },

		Todo = { fg = colors.foreground, italic = true },

		Added = { fg = colors.green },
		Changed = { fg = colors.blue },
		Removed = { fg = colors.red },

		Cursor = { reverse = true },
		vCursor = { reverse = true },
		iCursor = { reverse = true },
		lCursor = { reverse = true },
		CursorIM = { reverse = true },

		CursorColumn = { bg = util.darken(colors.gray, 0.65) },
		CursorLine = { link = "CursorColumn" },
		ColorColumn = { bg = util.darken(colors.gray, 0.75) },
		CursorLineNr = { fg = colors.accent },
		LineNr = { fg = util.darken(colors.gray, 0.15) },

		MatchParen = { reverse = true }, -- don't use reverse here

		LspReferenceText = { fg = colors.highlight, sp = colors.highlight, undercurl = true },
		LspReferenceWrite = { link = "LspReferenceText" },
		LspReferenceRead = { link = "LspReferenceText" },

		LspInlayHint = { fg = util.darken(colors.foreground, 0.3), italic = true },

		DiagnosticError = { fg = colors.magenta },
		DiagnosticHint = { fg = colors.sky },
		DiagnosticInfo = { fg = colors.foreground },
		DiagnosticWarn = { fg = colors.lavender },

		-- stylua: ignore start
		DiagnosticVirtualTextError = { fg = opts.diagnostics.darker and util.darken(colors.magenta, 0.35) or colors.magenta, },
		DiagnosticVirtualTextWarn = { fg = opts.diagnostics.darker and util.darken(colors.lavender, 0.35) or colors.lavender, },
		DiagnosticVirtualTextInfo = { fg = opts.diagnostics.darker and util.darken(colors.foreground, 0.35) or colors.foreground, },
		DiagnosticVirtualTextHint = { fg = opts.diagnostics.darker and util.darken(colors.sky, 0.35) or colors.sky },
		-- stylua: ignore end

		DiagnosticUnderlineError = { sp = colors.magenta, undercurl = true },
		DiagnosticUnderlineHint = { sp = colors.sky, undercurl = true },
		DiagnosticUnderlineInfo = { sp = colors.foreground, undercurl = true },
		DiagnosticUnderlineWarn = { sp = colors.lavender, undercurl = true },

		GitGutterAdd = { fg = colors.green },
		GitGutterChange = { fg = colors.blue },
		GitGutterDelete = { fg = colors.magenta },

		GitSignsAdd = { fg = colors.green },
		GitSignsAddLn = { fg = colors.green },
		GitSignsAddNr = { fg = colors.green },
		GitSignsChange = { fg = colors.blue },
		GitSignsChangeLn = { fg = colors.blue },
		GitSignsChangeNr = { fg = colors.blue },
		GitSignsDelete = { fg = colors.magenta },
		GitSignsDeleteLn = { fg = colors.magenta },
		GitSignsDeleteNr = { fg = colors.magenta },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Constant" },
		["@constant.macro"] = { link = "Macro" },

		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		["@function.macro"] = { link = "@constant.macro" },
		["@function.method"] = { link = "Function" },

		["@variable"] = { link = "Normal" },
		["@variable.member"] = { fg = colors.sky },
		["@variable.builtin"] = { fg = util.lighten(colors.red, 0.15) },

		["@type"] = { fg = colors.magenta },

		["@property"] = { link = "@variable.member" },
		["@constructor"] = { fg = colors.magenta, bold = true },
		["@module"] = { fg = colors.teal },
		["@keyword.import"] = { fg = colors.foreground },
		["@operator"] = { link = "Delimiter" },
		["@punctuation.delimiter"] = { link = "@operator" },
	}

	return hl
end

return M
