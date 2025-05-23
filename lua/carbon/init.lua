local M = {}

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
		highlights = vim.tbl_deep_extend("force", highlights, colors["@overrides"]())
	end
	highlights = vim.tbl_deep_extend("force", highlights, config.overrides.highlights)
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

return M
