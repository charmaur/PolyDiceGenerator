# PolyDiceGenerator

A customizable **Polyhedral Dice Generator** for OpenSCAD.

![Image of dice](images/dice_render.png)

## Requirements

- OpenSCAD <http://www.openscad.org>
- The BOSL2 library <https://github.com/revarbat/BOSL2>

## Number Distribution Options

- **Standard N+1** - The typical N+1 distribution where opposing sides of the die add up to N (number of sides of the die) +1. This is the default.
- **DiceLab** - A balanced distribution of numbers optimized for fairness by <http://thedicelab.com>.
- **Custom** - Selecting "Custom" allows user-defined distributions to be created for numbers, symbols, underscores, and rotation.

***Note:** It is possible to add symbols to the "Standard N+1" and "DiceLab" distributions without first selecting "Custom." However, altering distributions for numbers, underscores, or rotations will require selecting "Custom" first.*

## Custom Distributions

Distributions are set by creating a list (numbers, underscores, symbols, and rotation angles) of values (aka elements). The elements are rendered in the same order that the sides of the die are generated and is controlled by the BOSL2 library. Distributing elements to specific sides of each die is done by reordering the elements within each list.

***Note:** Element positions correlate across all lists, e.g., if the numbers list has `"9"` in the first position, and you want to add an underscore, the `"_"` should also be in the first position in the underscores list.*

***Note:** Each list will contain a number of elements equal to the number of characters rendered on the die, e.g., 6 elements for the d6, 8 for the d8, 12 for the d4, etc. There is one exception:*

- *A crystal d4c is a 6 sided cube with 4 numbered sides and 2 opossing points. The distribution lists for the d4c contain 6 elements, 2 of them being `" "` blank.*

### Distribution Lists

- **Numbers** - Consists of numbers, letters, or properly escaped unicode characters within the defined font (e.g., `"\u263C"` will produce ☼). If you'd like to use periods instead of underscores, that can be done in this list (e.g., `"6."` and `"9."`). The following example shows the `Standard N+1` number distribution for the d6.

  ***Example:*** `d6_custom_dist=["1","3","5","2","4","6"];`
  - Bracket enclosed `[]` quoted `" "` elements seperated by commas `,`.
  - Blanking out an element `" "` will prevent it from being rendered.
  - The number font is set using the `number_font`variable.

- **Symbols** - A list for adding symbols. In the following example the symbol mapped to the letter `"K"` will be rendered in place of the number 4.

  ***Example:*** `d6_symbols=[undef,undef,undef,undef,"K",undef];`
  - Bracket enclosed `[]` quoted `" "` characters seperated by commas `,`.
  - The value `undef` or `"undef"` is used where a symbol is not wanted.
  - The symbol mapped to the character entered will be rendered using the `symbol_font` variable.

  ***Note:** After making changes to symbol elements the Customizer may wrap unquoted `undef` values in quotes as `"undef"`. The quotes will not affect opperation and can be ignored.*

- **Underscores** - A list for adding underscores. In the following example an underscore will be rendered under the number 6.

  ***Example:*** `d6_custom_under=[" "," "," "," "," ","_"];`
  - Bracket enclosed `[]` quoted `" "` underscores seperated by commas `,`.
  - Blanking out an element `" "` will prevent an underscore from being rendered.
  - Underscores are rendered using the `underscore_font` variable.

- **Rotation** - A list for altering the default rotation of a particular element. In this example the number `5` will be rotated 90 degrees.

  ***Example:*** `d6_custom_rotate=[0,0,90,0,0,0];`
  - Bracket enclosed `[]` non-quoted numbers (in degrees) seperated by commas `,`.
  - A zero value `0` will use the default rotation for that element.

***Note:** Some dice will not utilize all 4 lists. The d4, for example, has no need for underscores, so that list is not avaliable.*

## Variables

### Fonts

|Variable Name    |Description|
|---              |---        |
|`number_font`    |Name of font to use for numbers.    |
|`underscore_font`|Name of font to use for underscores.|
|`symbol_font`    |Name of font to use for symbols.    |

***Note:** These values are not the filename of the font, but the logical font name (internally handled by the fontconfig library). This can also include a style parameter. A list of installed fonts & styles can be obtained using the font list dialog (Help > Font List).*

***Note:** Fonts must be installed on the system as well as coppied into the OpenSCAD install location /font directory. OpenSCAD requires a restart to load newly installed fonts.*

### Dice to Draw

|Variable Name|Description|
|---          |---        |
|`d(n)`       |Checked dice will be rendered.|

### Dice Size

|Variable Name|Description|
|---          |---        |
|`d(n)_size`  |Size (in millimeters) of each die.|

***Note:** Variables are converted into a percentage of the die's size. This allows them to uniformally scale while increasing or decreasing its size.*

### Number Depth

|Variable Name |Description|
|---           |---        |
|`number_depth`|Extrusion depth (in millimeters) for numbers, underscores, and symbols.|

### Rounding

|Variable Name       |Description|
|---                 |---        |
|`edge_rounding`     |Edge rounding adjustment for all dice. `0` to disable.|
|`d6_corner_rounding`|Corner rounding adjustment for the `d6` only. `0` to disable.|

### Standard Variables for all Dice

|Variable Name         |Description|
|---                   |---        |
|`d(n)_distribution`   |Select between a pre-built number distribution (`Standard N+1` and `DiceLab`) or a `Custom` option that allows user-defined values.|
|`d(n)_number_size`    |Size adjustment for numbers.|
|`d(n)_number_v_push`  |Vertical offset adjustment for numbers.|
|`d(n)_number_h_push`  |Horizontal offset adjustment for numbers.|
|`d(n)_number_spacing` |Spacing adjustment for numbers with multiple characters (e.g., double digit numbers, or say a 6 with a period like `"6."`). Think of this as a kerning adjustment.|
|`d(n)_number_4_h_push`|Horizontal offset adjustment for the number `"4"`.|
|`d(n)_custom_dist`    |User-defined list for number distribution. The order of elements in this list can be referenced when adding symbols, underscores, and rotation.|
|`d(n)_symbols`        |User-defined list for adding symbols.|
|`d(n)_symbol_size`    |Size adjustment for symbols.|
|`d(n)_symbol_v_push`  |Vertical offset adjustment for symbols.|
|`d(n)_symbol_h_push`  |Horizontal offset adjustment for symbols.|
|`d(n)_custom_under`   |User-defined list for adding underscores.|
|`d(n)_under_size`     |Size adjustment for underscores.|
|`d(n)_under_push`     |Vertical offset adjustment for underscores.|
|`d(n)_custom_rotate`  |User-defined list of angles for adjusting an elements rotation.|

### d4 Tetrahedron

- Standard Variables Only (see above)

### d4c Crystal

|Variable Name     |Description|
|---               |---        |
|`d4c_body_length` |Body length adjustment for `d4c`. |
|`d4c_point_length`|Point length adjustment for `d4c`.|

### d6 Cube

|Variable Name       |Description|
|---                 |---        |
|`d6_angle_numbers`  |Angle `d6` numbers by 45 degrees.|
|`d6_pip_dist`       |User-defined list for adding and distributing pips to the `d6`.|
|`d6_pip_size`       |Size adjustment for `d6` pips.|
|`d6_pip_offset`     |Adjustment for distance between `d6` pips.|
|`d6_pip_symbol_dist`|User-defined list for setting up symbol distribution in pip patterns on the `d6`. The list should contain numbers `"1"` thru `"6"`, the order of which will likely mimic those set in `d6_custom_dist`.|
|`d6_pip_symbols`    |User-defined list for adding symbols in place of `d6` pips.|

### d8 Octahedron

- Standard Variables Only

### d10 Trapezohedron

|Variable Name   |Description|
|---             |---        |
|`d10_length_mod`|Point length adjustment for the `d10`.|

### d00 Trapezohedron

|Variable Name      |Description|
|---                |---        |
|`d00_length_mod`   |Point length adjustment for the `d00`.|
|`d00_angle_numbers`|Angle `d00` numbers by `90` degrees.|
|`d00_0_size`       |Size adjustment for the `d00` 2nd digit `"0"`. Only applies when `d00_angle_numbers` is `checked` or set to `true`.|
|`d00_0_padding`    |Spacing adjustment between the `d10` 1st digit number and 2nd digit `"0"`. Only applies when `d00_angle_numbers` is `checked` or set to `true`.|

### d12 Dodecahedron

- Standard Variables Only

### d20 Icosahedron

- Standard Variables Only

### Hidden Variables

- Variables declaring the distribution of numbers, underscores, and rotation for `Standard`, `DiceLab`, and future numbering layouts. These un-editable *default* values are hidden from the customizer.

## Changelog

- [CHANGELOG.md](CHANGELOG.md)