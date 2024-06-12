local M = {}

--: ensureColor() explanation {{{
--[[
	The ensureColor function takes a color value as a number, ensures it is within the valid range of 0-255,
	and returns the adjusted value. This is done by preventing the value from being too dark (less than 0)
	or too bright (more than 255), and rounding the value to the nearest integer to ensure it's a whole number.
--]]
--: }}}
local function ensureColor(color)
	local result = color

	-- Ensure the blended value is not less than 0.
	-- This prevents the color from being too dark.
	result = math.max(0, result)

	-- Ensure the blended value is not more than 255.
	-- This prevents the color from being too bright.
	result = math.min(result, 255)

	-- Round the blended value to the nearest integer.
	-- This ensures the color value is a whole number.
	result = math.floor(result + 0.5)

	return result
end

--: hexToRgb() explanation {{{
--[[
	The hexToRgb function takes a hexadecimal color code as a string, converts it to lowercase,
	extracts the red, green, and blue components using pattern matching, and returns them as a table
	containing the decimal values of each component.
--]]
--: }}}
local function hexToRgb(hex_color)
	-- Convert the hex color code to lowercase.
	hex_color = string.lower(hex_color)

	-- Use pattern matching to extract the red, green, and blue components from the hex color code.
	local r, g, b = hex_color:match("#(%x%x)(%x%x)(%x%x)")

	-- Convert the extracted hexadecimal values to decimal and return them as a table.
	return {
		tonumber(r, 16),
		tonumber(g, 16),
		tonumber(b, 16),
	}
end

--: M.blend() explanation {{{
--[[
	The blend function blends two colors together based on a given factor. This function is useful for creating
	gradual color transitions or for combining two colors to create a new shade.

	It takes three parameters: color1 and color2 as hex strings, and factor as a number betwhenn 0 and 1 or a string representing a hex value.

	The factor parameter determines the ratio of color1 to color2 in the resulting blended color. A factor of 0 would result in color1,
	a factor of 1 would result in color2, and a factor of 0.5 would result in a 50/50 blend of the two colors.

	The blended color is calculated by first convertting it color channel into rgb with the hexToRgb() function,
	then blending each color channel (red, green, and blue) separately, and lastly convertting the final result back to hexadecimal,
	ensuring that the resulting values are within the valid range for a color component (0-255) with the ensureColor() function.
--]]
--: }}}
function M.blend(color1, color2, factor)
	-- Convert factor to a number if it's a hex string. Making sure it's betwheen 0 and 1.
	factor = type(factor) == "string" and (tonumber(factor, 16) / 0xff) or factor

	-- Convert hex colors to RGB.
	local rgb_color1 = hexToRgb(color1)
	local rgb_color2 = hexToRgb(color2)

	-- Function to blend a single color channel.
	local blendChannel = function(i)
		local result = (factor * rgb_color1[i] + ((1 - factor) * rgb_color2[i]))
		return ensureColor(result)
	end

	-- Convert the blended RGB color back to hexadecimal and return it.
	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

--: M.darken() explanation {{{
--[[
	The darken function takes a hexadecimal color code and a factor as input,
	and returns a new hexadecimal color code that is darker than the original
	by the specified factor.

	The function works by subtracting the factor from each component of the RGB color,
	ensuring that the resulting values are within the valid range for a color component (0-255) with the ensureColor() function.
--]]
--: }}}
function M.darken(color, factor)
	local rgb_color = hexToRgb(color)

	-- Function to subtract the factor from each component of the RGB color.
	local blendChannel = function(index)
		local blend = (rgb_color[index] - factor)
		return ensureColor(blend)
	end

	-- Convert the darkened RGB color back to hexadecimal and return it.
	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

--: M.lighten() explanation {{{
--[[
	The lighten function takes a hexadecimal color code and a factor as input,
	and returns a new hexadecimal color code that is lighter than the original
	by the specified factor.

	The function works by adding the factor from each component of the RGB color,
	ensuring that the resulting values are within the valid range for a color component (0-255) with the ensureColor() function.
--]]
--: }}}
function M.lighten(color, factor)
	local rgb_color = hexToRgb(color)

	-- Function to add the factor from each component of the RGB color.
	local blendChannel = function(index)
		local blend = (rgb_color[index] + factor)
		return ensureColor(blend)
	end

	-- Convert the lightened RGB color back to hexadecimal and return it.
	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

return M
