local colors = require("carbon").get_colors()

local bg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "NormalFloat" }).bg)
local statusline = vim.api.nvim_get_hl(0, { name = "StatusLine" })

for k, v in pairs(statusline) do
	if type(v) == "number" then
		statusline[k] = string.format("#%06x", v)
	end
end

if colors.background:lower() == "none" then
	statusline.bg = "NONE" ---@diagnostic disable-line: assign-type-mismatch
	vim.api.nvim_set_hl(0, "StatusLine", statusline) ---@diagnostic disable-line: param-type-mismatch
end

local function segment(color)
	return {
		a = { fg = bg, bg = color, gui = "bold" },
		b = { fg = color, bg = bg },
		c = { fg = colors.foreground, bg = statusline.bg },
	}
end

local lualine = {
	inactive = segment(colors.gray),
	normal = segment(colors.lavender),
	visual = segment(colors.blue),
	replace = segment(colors.magenta),
	insert = segment(colors.pink),
	command = segment(colors.green),
	terminal = segment(colors.foreground),
}

return lualine
