# 🎨 Color Utilities

## Manipulation Functions

Neopywal offers a neat set of utility functions that allows the user to manipulate Neopywal's colors in case you want, for example, a darker color than `color1`. Or a brighter and more saturated version of the color `color3`. And so on ...
\
These functions are all present under `utils/color.lua` module and can be required like so:

```lua
local U = require("neopywal.utils.color")

U.darken(color, factor)
U.lighten(color, factor)
U.blend(color1, color2, percentage)
U.brighten(color, percentage)
U.blacken(color, percentage)
U.saturate(color, percentage)
U.invert(color)
```

> [!IMPORTANT]
> All color parameters for the functions have to be in hexadecimal format (e.g.: "#000000").

<!-- Darken/Lighten {{{ -->

### Darken and Lighten

As the name suggests, the `darken()` and `lighten()` functions are able to create new colors by darkening/lightening existing colors.
\
Both functions take two parameters, the first one is the hexadecimal code of color you want to modify, the second is an integer from 0 to 100 that defines how much said color will be darken/lighten.

```lua
local C = require("neopywal").get_colors() -- Using catppuccin-mocha theme.
local U = require("neopywal.utils.color")

print(C.color1) -- For comparison: #F38BA8"
print(U.darken(C.color1, 70)) -- Output: "#AD4562"
print(U.lighten(C.color1, 70)) -- Output: "#FFD1EE"
```

<!-- panvimdoc-ignore-start -->

Here's some visual interpretation for the colors.

<table>
<tr>
<td> <b>Normal vs Darken/Lighten</b> </td> <td> <b>Hex</b> </td> <td> <b>Color</b> </td>
</tr>

<!-- darken 70 {{{ -->
<tr>
<td>

```lua
U.darken(C.color1, 70)
```

</td>
<td> Hex: "#AD4562"</td>
<td> <img src="../assets/docs/circles/darken_70.svg" /> </td>
</tr>
<!-- }}} -->
<!-- control C.color1 {{{ -->
<tr>
<td>

```lua
C.color1
```

</td>
<td> Hex: "#F38BA8" </td>
<td> <img src="../assets/docs/circles/color1.svg" /> </td>
</tr>
<!-- }}} -->
<!-- lighten 70 {{{ -->
<tr>
<td>

```lua
U.lighten(C.color1, 70)
```

</td>
<td> Hex: "#FFD1EE"</td>
<td> <img src="../assets/docs/circles/lighten_70.svg" /> </td>
</tr>
<!-- }}} -->

</table>

<!-- panvimdoc-ignore-end -->

It is important to know that these functions do NOT modify the color based on percentage values.
Instead they work in a more linear way by converting the hexadecimal color to it's numeric RGB values and then subtracting/adding the value present on the `factor` argument given to them.

<!-- }}} -->
<!-- Blend {{{ -->

### Blend

The `blend()` function combines two colors to create a new color that is a mixture of the two colors specified.
\
The function takes three parameters, the first two parameters define the colors to be blended.
While the third `percentage` parameter is a number between 0 and 1 that determines the proportion of each color in the final output.
Where 1 means "use the exact same color as the first parameter" and 0 means "use the exact same color as the second parameter".

```lua
local C = require("neopywal").get_colors() -- Using catppuccin-mocha theme.
local U = require("neopywal.utils.color")

-- In this example:

-- `U.blend(C.color1, C.color3, 0)` will be identical to `C.color3`.
-- `U.blend(C.color1, C.color3, 1)` will be identical to `C.color1`.
-- `U.blend(C.color1, C.color3, 0.5)` will be a 50/50 mix of `C.color1` and `C.color3`.

print(C.color1) -- For comparison: #F38BA8"
print(C.color3) -- For comparison: "#F9E2AF"
print(U.blend(C.color1, C.color3, 0)) -- Output: "#F9E2AF"
print(U.blend(C.color1, C.color3, 1)) -- Output: "#F38BA8"
print(U.blend(C.color1, C.color3, 0.5)) -- Output: "#F6B7AC"
```

<!-- panvimdoc-ignore-start -->

Here's some visual interpretation for the colors.

<table>
<tr>
<td> <b>Normal vs Blend</b> </td> <td> <b>Hex</b> </td> <td> <b>Color</b> </td>
</tr>

<!-- Blend = C.color1 {{{ -->
<tr>
<td>

```lua
C.color1
U.blend(C.color1, C.color3, 1)
```

</td>
<td> Hex: "#F38BA8" </td>
<td> <img src="../assets/docs/circles/color1.svg" /> </td>
</tr>
<!-- }}} -->
<!-- Blend = C.color3 {{{ -->
<tr>
<td>

```lua
C.color3
U.blend(C.color1, C.color3, 0)
```

</td>
<td> Hex: "#F9E2AF" </td>
<td> <img src="../assets/docs/circles/color3.svg" /> </td>
</tr>
<!-- }}} -->
<!-- Blend C.color1 and C.color3 {{{ -->
<tr>
<td>

```lua
U.blend(C.color1, C.color3, 0.5)
```

</td>
<td> Hex: "#F6B7AC" </td>
<td> <img src="../assets/docs/circles/blend_c1_c3.svg" /> </td>
</tr>
<!-- }}} -->

</table>

<!-- panvimdoc-ignore-end -->
<!-- }}} -->
<!-- Blacken/Brighten {{{ -->

### Blacken and Brighten

The `blacken()` and the `brighten()` functions are similar to the `darken()` and `lighten()` functions. However they work in completely different ways.
\
While `darken()`/`lighten()` first convert the input hexadecimal color as a RGB number before manipulating it. `blacken()`/`brighten()` instead take the hexadecimal color and convert it to the HSL color space, were it will be manipulated by increasing/decreasing the "L" lightness value of the color based on a percentage.
\
Both functions take two parameters, the first one is the hexadecimal code of color you want to modify, and the second is an number from 0 to 1 that defines how much said color will be brightened/blackened out.

```lua
local C = require("neopywal").get_colors() -- Using catppuccin-mocha theme.
local U = require("neopywal.utils.color")

print(C.color1) -- For comparison: #F38BA8"
print(U.blacken(C.color1, 0.7)) -- Output: "#621130"
print(U.brighten(C.color1, 0.7)) -- Output: "#FBDEE4"
```

<!-- panvimdoc-ignore-start -->

If you want to see the difference in the outputs of `darken()`/`lighten()` vs `blacken()`/`brighten()`, here's an table that compares the output of all functions using the [catppuccin-mocha](../lua/neopywal/palettes/catppuccin-mocha.lua) theme as the main Neopywal source palette.

<table>
<tr>
<td> <b>Darken vs Blacken</b> </td> <td> <b>Hex</b> </td> <td> <b>Color</b> </td>
</tr>

<!-- control C.color1 {{{ -->
<tr>
<td>

```lua
C.color1
```

</td>
<td> Hex: "#F38BA8" </td>
<td> <img src="../assets/docs/circles/color1.svg" /> </td>
</tr>
<!-- }}} -->
<!-- darken 70 {{{ -->
<tr>
<td>

```lua
U.darken(C.color1, 70)
```

</td>
<td> Hex: "#AD4562"</td>
<td> <img src="../assets/docs/circles/darken_70.svg" /> </td>
</tr>
<!-- }}} -->
<!-- blacken 0.7 {{{ -->
<tr>
<td>

```lua
U.blacken(C.color1, 0.7)
```

</td>
<td> Hex: "#621130"</td>
<td> <img src="../assets/docs/circles/blacken_70.svg" /> </td>
</tr>
<!-- }}} -->
<!-- darken 100 {{{ -->
<tr>
<td>

```lua
U.darken(C.color1, 100)
```

</td>
<td> Hex: "#8F2744"</td>
<td> <img src="../assets/docs/circles/darken_100.svg" /> </td>
</tr>
<!-- }}} -->
<!-- blacken 100 {{{ -->
<tr>
<td>

```lua
-- Outputs pure black.
U.blacken(C.color1, 1)
```

</td>
<td> Hex: "#000000"</td>
<td> <img src="../assets/docs/circles/blacken_100.svg" /> </td>
</tr>
<!-- }}} -->

<tr>
<td> <b>Lighten vs Brighten</b> </td> <td> <b>Hex</b> </td> <td> <b>Color</b> </td>
</tr>

<!-- control C.color1 {{{ -->
<tr>
<td>

```lua
C.color1
```

</td>
<td> Hex: "#F38BA8" </td>
<td> <img src="../assets/docs/circles/color1.svg" /> </td>
</tr>
<!-- }}} -->
<!-- lighten 70 {{{ -->
<tr>
<td>

```lua
U.lighten(C.color1, 70)
```

</td>
<td> Hex: "#FFD1EE"</td>
<td> <img src="../assets/docs/circles/lighten_70.svg" /> </td>
</tr>
<!-- }}} -->
<!-- brighten 0.7 {{{ -->
<tr>
<td>

```lua
U.brighten(C.color1, 0.7)
```

</td>
<td> Hex: "#FBDEE4"</td>
<td> <img src="../assets/docs/circles/brighten_70.svg" /> </td>
</tr>
<!-- }}} -->
<!-- lighten 100 {{{ -->
<tr>
<td>

```lua
U.lighten(C.color1, 100)
```

</td>
<td> Hex: "#FFEFFF"</td>
<td> <img src="../assets/docs/circles/lighten_100.svg" /> </td>
</tr>
<!-- }}} -->
<!-- brighten 100 {{{ -->
<tr>
<td>

```lua
-- Outputs pure white.
U.brighten(C.color1, 1)
```

</td>
<td> Hex: "#FFFFFF"</td>
<td> <img src="../assets/docs/circles/brighten_100.svg" /> </td>
</tr>
<!-- }}} -->

</table>

<!-- panvimdoc-ignore-end -->
<!-- }}} -->
<!-- Saturate {{{ -->

### Saturate

The `saturate()` function increases the saturation of a given color.
\
It take two parameters, the first one is the hexadecimal code of color you want to saturate, and the second is an number between 0 and 1 that defines how much said color will be saturated.

```lua
local C = require("neopywal").get_colors() -- Using catppuccin-mocha theme.
local U = require("neopywal.utils.color")

print(C.color4) -- For comparison: "#89B4FA"
print(U.saturate(C.color4, 0.7)) -- Output: "#FA4B8D"
```

<!-- panvimdoc-ignore-start -->

Here's some visual interpretation for the colors.

<table>
<tr>
<td> <b>Normal vs Saturated</b> </td> <td> <b>Hex</b> </td> <td> <b>Color</b> </td>
</tr>

<!-- control C.color4 {{{ -->
<tr>
<td>

```lua
C.color4
```

</td>
<td> Hex: "#89B4FA" </td>
<td> <img src="../assets/docs/circles/color4.svg" /> </td>
</tr>
<!-- }}} -->
<!-- Invert C.color4 {{{ -->
<tr>
<td>

```lua
U.saturate(C.color4, 0.7)
```

</td>
<td> Hex: "#FA4B8D"</td>
<td> <img src="../assets/docs/circles/saturate_color4_70.svg" /> </td>
</tr>
<!-- }}} -->

</table>

<!-- panvimdoc-ignore-end -->
<!-- }}} -->
<!-- Invert {{{ -->

### Invert

The `invert()` simply takes an hexadecimal color code and, well ..., inverts it's color.

```lua
local C = require("neopywal").get_colors() -- Using catppuccin-mocha theme.
local U = require("neopywal.utils.color")

print(C.color4) -- For comparison: "#89B4FA"
print(U.invert(C.color4)) -- Output: "#2276c9"
```

<!-- panvimdoc-ignore-start -->

Here's some visual interpretation for the colors.

<table>
<tr>
<td> <b>Normal vs Invert</b> </td> <td> <b>Hex</b> </td> <td> <b>Color</b> </td>
</tr>

<!-- control C.color4 {{{ -->
<tr>
<td>

```lua
C.color4
```

</td>
<td> Hex: "#89B4FA" </td>
<td> <img src="../assets/docs/circles/color4.svg" /> </td>
</tr>
<!-- }}} -->
<!-- Invert C.color4 {{{ -->
<tr>
<td>

```lua
U.invert(C.color4)
```

</td>
<td> Hex: "#2276C9"</td>
<td> <img src="../assets/docs/circles/invert_color4.svg" /> </td>
</tr>
<!-- }}} -->

</table>

<!-- panvimdoc-ignore-end -->
<!-- }}} -->
