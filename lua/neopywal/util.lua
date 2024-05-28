local M = {}
local colors = require("neopywal").get_colors()

-- Function to ensure a color value is within the valid range
local function ensureColor(color)
	local result = color

	-- Ensure the blended value is not less than 0
	-- This prevents the color from being too dark
	result = math.max(0, result)

	-- Ensure the blended value is not more than 255
	-- This prevents the color from being too bright
	result = math.min(result, 255)

	-- Round the blended value to the nearest integer
	-- This ensures the color value is a whole number
	result = math.floor(result + 0.5)

	return result
end

-- Function to convert a hexadecimal color code to RGB values
local function hexToRgb(hex_color)
	-- Convert the hex color code to lowercase
	hex_color = string.lower(hex_color)

	-- Use pattern matching to extract the red, green, and blue components from the hex color code
	local r, g, b = hex_color:match("#(%x%x)(%x%x)(%x%x)")

	-- Convert the extracted hexadecimal values to decimal and return them as a table
	return {
		tonumber(r, 16),
		tonumber(g, 16),
		tonumber(b, 16),
	}
end

-- Function to darken a color by a specified factor
function M.darken(color, factor)
	local rgb_color = hexToRgb(color)

	local blendChannel = function(index)
		local blend = (rgb_color[index] - factor) -- Subtract the factor from each component of the RGB color
		return ensureColor(blend)
	end

	-- Convert the darkened RGB color back to hexadecimal and return it
	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

-- Function to lighten a color by a specified factor
function M.lighten(color, factor)
	local rgb_color = hexToRgb(color)

	local blendChannel = function(index)
		local blend = (rgb_color[index] + factor) -- Add the factor from each component of the RGB color
		return ensureColor(blend)
	end

	-- Convert the lightened RGB color back to hexadecimal and return it
	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

-- Function to set the alpha channel of a color
function M.alpha(color, alpha)
	-- If alpha is a string, convert it from hexadecimal to a decimal value between 0 and 1
	-- Otherwise, assume alpha is already a decimal value
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha

	local rgb_color = hexToRgb(color)
	local helper_color = hexToRgb(colors.background)

	local blendChannel = function(index)
		local blend = (alpha * rgb_color[index] + ((1 - alpha) * helper_color[index]))
		return ensureColor(blend)
	end

	-- Convert the generated RGB color back to hexadecimal and return it
	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

-- This function blends two colors together based on a given factor.
-- The factor can be a number between 0 and 1, or a hexadecimal color code.
function M.blend(color1, color2, factor)
	-- If the factor is a string, it's assumed to be a hexadecimal color code.
	-- We convert it to a number and divide it by 255 to get a value between 0 and 1.
	factor = type(factor) == "string" and (tonumber(factor, 16) / 0xff) or factor

	local rgb_color1 = hexToRgb(color1)
	local rgb_color2 = hexToRgb(color2)

	local blendChannel = function(i)
		local result = (factor * rgb_color1[i] + ((1 - factor) * rgb_color2[i]))
		return ensureColor(result)
	end

	-- Convert the generated RGB color back to hexadecimal and return it
	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

return M
