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
	util.fg = colors.white
	util.bg = colors.black

	---@type table<string, carbon.Highlight>
	local hl = {
		Normal = { fg = colors.foreground, bg = colors.background },
		Title = { link = "NormalFloat" },
		Terminal = { link = "Normal" },

		NormalFloat = { fg = colors.foreground, bg = colors.background_float },
		FloatTitle = { fg = colors.lavender, bg = colors.background_float },
		FloatBorder = { fg = colors.brackets, bg = colors.background_float },

		Pmenu = { link = "NormalFloat" },
		PmenuSbar = { link = "Pmenu", fg = "none" },
		PmenuSel = { bg = util.lighten(colors.background_float, 0.2) },
		WildMenu = { fg = colors.black, bg = colors.blue },
		PmenuThumb = { fg = "none", bg = colors.gray },

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
		Operator = { fg = colors.brackets },
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

		Module = { fg = colors.teal },
		Constructor = { fg = colors.magenta },
		Field = { fg = colors.sky },
		Variable = { link = "Normal" },

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

		-- Default = {},
		-- Array = {},
		-- Boolean = {},
		-- Class = {},
		-- Color = {},
		-- Constant = {},
		-- Constructor = {},
		-- Enum = {},
		-- EnumMember = {},
		-- Event = {},
		-- Field = {},
		-- File = {},
		-- Folder = {},
		-- Function = {},
		-- Interface = {},
		-- Key = {},
		-- Keyword = {},
		-- Method = {},
		-- Module = {},
		-- Namespace = {},
		-- Null = {},
		-- Number = {},
		-- Object = {},
		-- Operator = {},
		-- Package = {},
		-- Property = {},
		-- Reference = {},
		-- Snippet = {},
		-- String = {},
		-- Struct = {},
		-- Text = {},
		-- TypeParameter = {},
		-- Unit = {},
		-- Value = {},
		-- Variable = {},

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

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Constant" },
		["@constant.macro"] = { link = "Macro" },

		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		["@function.macro"] = { link = "Macro" },
		["@function.method"] = { link = "Function" },

		["@variable"] = { link = "Variable" },
		["@variable.member"] = { link = "Field" },
		["@variable.builtin"] = { fg = util.lighten(colors.red, 0.15) },

		["@type"] = { link = "Type" },

		["@property"] = { link = "Field" },
		["@constructor"] = { link = "Constructor" },
		["@module"] = { link = "Module" },
		["@keyword.import"] = { fg = colors.foreground },
		["@operator"] = { link = "Operator" },
		["@punctuation.delimiter"] = { link = "Delimiter" },

		TelescopeNormal = { link = "NormalFloat" },
		TelescopeTitle = { link = "FloatTitle" },
		TelescopeBorder = { link = "FloatBorder" },
		TelescopePromptBorder = { link = "TelescopeBorder" },
		TelescopeResultsBorder = { link = "TelescopeBorder" },
		TelescopePreviewBorder = { link = "TelescopeBorder" },
		TelescopeMatching = { fg = colors.accent, bold = true },
		TelescopePromptPrefix = { fg = colors.magenta },
		TelescopeSelectionCaret = { link = "TelescopePromptPrefix" },
		TelescopeMultiSelection = { fg = colors.sky },

		GitSignsAdd = { fg = colors.green },
		GitSignsAddLn = { fg = colors.green },
		GitSignsAddNr = { fg = colors.green },
		GitSignsChange = { fg = colors.blue },
		GitSignsChangeLn = { fg = colors.blue },
		GitSignsChangeNr = { fg = colors.blue },
		GitSignsDelete = { fg = colors.magenta },
		GitSignsDeleteLn = { fg = colors.magenta },
		GitSignsDeleteNr = { fg = colors.magenta },

		BlinkCmpKind = { fg = colors.blue },
		BlinkCmpKindText = { link = "Comment" },
		BlinkCmpKindMethod = { link = "Function" },
		BlinkCmpKindFunction = { link = "Function" },
		BlinkCmpKindConstructor = { link = "Constructor" },
		BlinkCmpKindField = { link = "Field" },
		BlinkCmpKindVariable = { link = "Variable" },
		BlinkCmpKindClass = { link = "Class" },
		-- BlinkCmpKindInterface = {},
		BlinkCmpKindModule = { link = "Module" },
		BlinkCmpKindProperty = { link = "Property" },
		BlinkCmpKindUnit = { link = "Unit" },
		BlinkCmpKindValue = { link = "Number" },
		-- BlinkCmpKindEnum = {},
		BlinkCmpKindKeyword = { link = "Keyword" },
		BlinkCmpKindSnippet = { fg = colors.lavender },
		-- BlinkCmpKindColor = {},
		BlinkCmpKindFile = { link = "Normal" },
		-- BlinkCmpKindReference = {},
		BlinkCmpKindFolder = { link = "OilDirIcon" },
		-- BlinkCmpKindEnumMember = {},
		BlinkCmpKindConstant = { link = "Constant" },
		BlinkCmpKindStruct = { link = "Type" },
		-- BlinkCmpKindEvent = {},
		BlinkCmpKindOperator = { link = "Operator" },
		BlinkCmpKindTypeParameter = { link = "Type" },

		NoiceCompletionItemKindDefault = { link = "BlinkCmpKind" },
		NoiceCompletionItemKindMethod = { link = "Function" },
		-- NoiceCompletionItemKindInterface = {},
		NoiceCompletionItemKindValue = { link = "Number" },
		-- NoiceCompletionItemKindEnum = {},
		NoiceCompletionItemKindVariable = { link = "Variable" },
		NoiceCompletionItemKindFile = { link = "Normal" },
		NoiceCompletionItemKindField = { link = "Field" },
		-- NoiceCompletionItemKindUnit = {},
		-- NoiceCompletionItemKindEnumMember = {},
		NoiceCompletionItemKindText = { link = "Comment" },
		NoiceCompletionItemKindFolder = { link = "OilDirIcon" },
		NoiceCompletionItemKindSnippet = { link = "BlinkCmpKindSnippet" },
		NoiceCompletionItemKindConstant = { link = "Constant" },
		NoiceCompletionItemKindProperty = { link = "Field" },
		NoiceCompletionItemKindKeyword = { link = "Keyword" },
		NoiceCompletionItemKindStruct = { link = "Type" },
		NoiceCompletionItemKindModule = { link = "Module" },
		NoiceCompletionItemKindConstructor = { link = "Constructor" },
		NoiceCompletionItemKindClass = { link = "Class" },
		NoiceCompletionItemKindFunction = { link = "Function" },
		-- NoiceCompletionItemKindColor = {},

		OilHidden = { fg = colors.accent },
		OilDir = { fg = colors.blue },
		OilDirHidden = { link = "Comment" },
		-- OilDirIcon = {},
		-- OilSocket = {},
		-- OilSocketHidden = {},
		-- OilLinkHidden = {},
		-- OilOrphanLinkHidden = {},
		OilLinkTarget = { fg = colors.gray },
		OilOrphanLinkTarget = { fg = colors.gray, sp = colors.magenta, undercurl = true },
		-- OilLinkTargetHidden = {},
		-- OilOrphanLinkTargetHidden = {},
		OilFileHidden = { link = "Comment" },
		-- OilCreate = {},
		-- OilDelete = {},
		-- OilMove = {},
		-- OilCopy = {},
		-- OilChange = {},
		-- OilRestore = {},
		-- OilPurge = {},
		-- OilTrash = {},
		-- OilTrashSourcePath = {},
	}

	return hl
end

return M
