local M = {}

function M.get_ibm_carbon()
	-- stylua: ignore
	return {
		red = {
			[100] = "#2d0709", [90] = "#520408", [80] = "#750e13", [70] = "#a2191f", [60] = "#da1e28",
			[50] = "#fa4d56", [40] = "#ff8389", [30] = "#ffb3b8", [20] = "#ffd7d9", [10] = "#fff1f1",
		},
		magenta = {
			[100] = "#2a0a18", [90] = "#510224", [80] = "#740937", [70] = "#9f1853", [60] = "#d02670",
			[50] = "#ee5396", [40] = "#ff7eb6", [30] = "#ffafd2", [20] = "#ffd6e8", [10] = "#fff0f7",
		},
		purple = {
			[100] = "#1c0f30", [90] = "#31135e", [80] = "#491d8b", [70] = "#6929c4", [60] = "#8a3ffc",
			[50] = "#a56eff", [40] = "#be95ff", [30] = "#d4bbff", [20] = "#e8Daff", [10] = "#f6f2ff",
		},
		blue = {
			[100] = "#001141", [90] = "#001d6c", [80] = "#002d9c", [70] = "#0043ce", [60] = "#0f62fe",
			[50] = "#4589ff", [40] = "#78a9ff", [30] = "#a6c8ff", [20] = "#d0e2ff", [10] = "#edf5ff",
		},
		cyan = {
			[100] = "#061727", [90] = "#012749", [80] = "#003a6d", [70] = "#00539a", [60] = "#0072c3",
			[50] = "#1192e8", [40] = "#33b1ff", [30] = "#82cfff", [20] = "#bae6ff", [10] = "#e5f6ff",
		},
		teal = {
			[100] = "#081a1c", [90] = "#022b30", [80] = "#004144", [70] = "#005d5d", [60] = "#007d79",
			[50] = "#009d9a", [40] = "#08bdba", [30] = "#3ddbd9", [20] = "#9ef0f0", [10] = "#d9fbfb",
		},
		green = {
			[100] = "#071908", [90] = "#022d0d", [80] = "#044317", [70] = "#0e6027", [60] = "#198038",
			[50] = "#24a148", [40] = "#42be65", [30] = "#6fdc8c", [20] = "#a7F0ba", [10] = "#defbe6",
		},
		cool_gray = {
			[100] = "#121619", [90] = "#21272a", [80] = "#343a3f", [70] = "#4d5358", [60] = "#697077",
			[50] = "#878d96", [40] = "#a2a9b0", [30] = "#c1c7cd", [20] = "#dde1E6", [10] = "#f2f4f8",
		},
		gray = {
			[100] = "#161616", [90] = "#262626", [80] = "#393939", [70] = "#525252", [60] = "#6f6f6f",
			[50] = "#8d8d8d", [40] = "#a8a8a8", [30] = "#c6c6c6", [20] = "#e0e0e0", [10] = "#f4f4f4",
		},
		warm_gray = {
			[100] = "#171414", [90] = "#272525", [80] = "#3c3838", [70] = "#565151", [60] = "#726e6e",
			[50] = "#8f8b8b", [40] = "#ada8a8", [30] = "#cac5c4", [20] = "#e5e0df", [10] = "#f7f3f2",
		},

		yellow = {
			[100] = "#1c1500", [90] = "#302400", [80] = "#483700", [70] = "#684e00", [60] = "#8e6a00",
			[50] = "#b28600", [40] = "#d2a106", [30] = "#f1c21b", [20] = "#fddc69", [10] = "#fcf4d6",
		},
		orange = {
			[100] = "#231000", [90] = "#3e1a00", [80] = "#5e2900", [70] = "#8a3800", [60] = "#ba4e00",
			[50] = "#eb6200", [40] = "#ff832b", [30] = "#ffb784", [20] = "#ffd9Be", [10] = "#fff2e8",
		},
	}
end

---@return carbon.Colors
function M.colors()
	local ibm_carbon = M.get_ibm_carbon()

	local colors = {
		foreground = ibm_carbon.cool_gray[30],

		background = "#080808",
		background_float = ibm_carbon.gray[100],
		background_statusline = "#292929",

		green = ibm_carbon.green[40],
		yellow = ibm_carbon.yellow[30],
		orange = ibm_carbon.orange[40],
		red = ibm_carbon.red[50],
		magenta = ibm_carbon.magenta[50],
		pink = ibm_carbon.magenta[40],
		lavender = ibm_carbon.purple[40],
		blue = ibm_carbon.blue[40],
		sky = ibm_carbon.cyan[30],
		cyan = ibm_carbon.cyan[40],
		teal = ibm_carbon.teal[40],
		white = ibm_carbon.cool_gray[10],
		gray = ibm_carbon.gray[50],
		black = ibm_carbon.gray[100],

		accent = ibm_carbon.magenta[40],
		highlight = ibm_carbon.cool_gray[10],
		brackets = ibm_carbon.gray[50],
	}

	return colors
end

return M
