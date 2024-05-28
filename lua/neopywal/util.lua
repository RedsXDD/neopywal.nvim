local M = {}

-- Function to convert a hexadecimal color code to RGB values
local function hexToRgb(hex_color)
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
	-- Convert the input color from hexadecimal to RGB
	local rgb_color = hexToRgb(color)

	-- Subtract the factor from each component of the RGB color, but don't go below 0
	-- math.min ensures that the result is not less than 0, and not more than 255
	rgb_color[1] = math.min(rgb_color[1] - factor, 255)
	rgb_color[2] = math.min(rgb_color[2] - factor, 255)
	rgb_color[3] = math.min(rgb_color[3] - factor, 255)

	-- Convert the darkened RGB color back to hexadecimal and return it
	return string.format("#%02x%02x%02x", rgb_color[1], rgb_color[2], rgb_color[3])
end

-- Function to lighten a color by a specified factor
function M.lighten(color, factor)
	-- Convert the input color from hexadecimal to RGB
	local rgb_color = hexToRgb(color)

	-- Add the factor to each component of the RGB color, but don't go above 255
	-- math.min ensures that the result is not more than 255
	rgb_color[1] = math.min(rgb_color[1] + factor, 255)
	rgb_color[2] = math.min(rgb_color[2] + factor, 255)
	rgb_color[3] = math.min(rgb_color[3] + factor, 255)

	-- Convert the lightened RGB color back to hexadecimal and return it
	return string.format("#%02x%02x%02x", rgb_color[1], rgb_color[2], rgb_color[3])
end

-- Function to set the alpha channel of a color
function M.alpha(color, alpha)
	-- If alpha is a string, convert it from hexadecimal to a decimal value between 0 and 1
	-- Otherwise, assume alpha is already a decimal value
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha

	-- Convert the input color from hexadecimal to RGB
	local rgb_color = hexToRgb(color)

	-- Create a helper color, which is black (RGB: 0, 0, 0)
	local helper_color = hexToRgb("#000000")

	-- Function to blend a single channel of each color.
	local blendChannel = function(index)
		local blend = (alpha * rgb_color[index] + ((1 - alpha) * helper_color[index]))

		blend = math.max(0, blend) -- Ensure the blended value is not less than 0
		blend = math.min(blend, 255) -- Ensure the blended value is not more than 255
		blend = math.floor(blend + 0.5) -- Round the blended value to the nearest integer

		return blend
	end

	-- Use the blendChannel() to blend each channel of the color, and return the result as a hexadecimal string
	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

return M
