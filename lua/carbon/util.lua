local M = {}

M.bg = "#000000"
M.fg = "#ffffff"

local function hexToRgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param foreground string|"NONE"
---@param background string
---@param alpha string|number
---@return string
function M.blend(foreground, background, alpha)
	if foreground:lower() == "none" then
		return "NONE"
	end

	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local bg = hexToRgb(background)
	local fg = hexToRgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * bg[i] + ((1 - alpha) * fg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

---@param hex string|"NONE"
---@param amount string|number
---@param bg string?
---@return string
function M.darken(hex, amount, bg)
	return M.blend(hex, bg or M.bg, amount)
end

---@param hex string|"NONE"
---@param amount string|number
---@param fg string?
---@return string
function M.lighten(hex, amount, fg)
	return M.blend(hex, fg or M.fg, amount)
end

return M
