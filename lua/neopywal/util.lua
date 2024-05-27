local M = {}

function M.lighten(color, factor)
	-- Extract the RGB values from the color
	local r, g, b = color:match("#(%x%x)(%x%x)(%x%x)")

	-- Convert the RGB values from hexadecimal to decimal
	r, g, b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)

	-- Apply the brightness factor to each RGB value
	r = math.min(r + factor, 255)
	g = math.min(g + factor, 255)
	b = math.min(b + factor, 255)

	-- Convert the RGB values back to hexadecimal and return the new color
	return string.format("#%02x%02x%02x", r, g, b)
end

function M.darken(color, factor)
	-- Extract the RGB values from the color
	local r, g, b = color:match("#(%x%x)(%x%x)(%x%x)")

	-- Convert the RGB values from hexadecimal to decimal
	r, g, b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)

	-- Apply the brightness factor to each RGB value
	r = math.min(r - factor, 255)
	g = math.min(g - factor, 255)
	b = math.min(b - factor, 255)

	-- Convert the RGB values back to hexadecimal and return the new color
	return string.format("#%02x%02x%02x", r, g, b)
end

return M
