local colors = require("carbon").get_colors()
local util = require("carbon.util")

local terminal = {
	a = { fg = colors.background_statusline, bg = colors.foreground, gui = "bold" },
	b = { fg = colors.foreground, bg = colors.background_statusline },
	c = { fg = colors.foreground, bg = util.blend(colors.background, colors.background_statusline, 0.35) },
}

local lualine = {
	inactive = vim.tbl_deep_extend("keep", { a = { bg = colors.teal }, b = { fg = colors.teal } }, terminal),
	normal = vim.tbl_deep_extend("keep", { a = { bg = colors.lavender }, b = { fg = colors.lavender } }, terminal),
	visual = vim.tbl_deep_extend("keep", { a = { bg = colors.blue }, b = { fg = colors.blue } }, terminal),
	replace = vim.tbl_deep_extend("keep", { a = { bg = colors.magenta }, b = { fg = colors.magenta } }, terminal),
	insert = vim.tbl_deep_extend("keep", { a = { bg = colors.pink }, b = { fg = colors.pink } }, terminal),
	command = vim.tbl_deep_extend("keep", { a = { bg = colors.green }, b = { fg = colors.green } }, terminal),
	terminal = terminal,
}

if terminal.c.bg:lower() == "none" then
	vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.foreground, bg = "none" })
end

return lualine
