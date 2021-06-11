# PolyDiceGenerator

A customizable **Polyhedral Dice Generator** for OpenSCAD.

## PolyDiceGenerator v0.27.4

- Added d4i - an infinity edge d4

## PolyDiceGenerator v0.27.3

- Fixed d4c/d4p corner rounding/clipping bug
- Added per-die spacing adjustment for double digit numbers

## PolyDiceGenerator v0.27.2

- Fixed d4c/d4p render issues with OpenSCAD 2021.01

## PolyDiceGenerator v0.27.1

- Tweaked arc generation values to improve render times
- Updated included BOSL2 library to 2.0.525
- BOSL2 update fixed d10/d00 rounding scale/alignmet bug

## PolyDiceGenerator v0.27.0

- Fixed number rotate bug when resizing d10/d00
- Added ability to change d4c/d6 pip shapes 'd(n)_pip_sides'
- Tweaked arc generation values to improve performance
- Updated included BOSL2 library to v2.0.499

## PolyDiceGenerator v0.26.11

- Fixed problem with bumpers not being unioned to dice.
- Updated arc generation values to improve performance.

## PolyDiceGenerator v0.26.10

- Added ability to draw bumpers around specified faces.

## PolyDiceGenerator v0.26.9

- Added d3 - a rounded triangular prism

## PolyDiceGenerator v0.26.8

- Added d12r - a rhombic dodecahedron

## PolyDiceGenerator v0.26.7

- Added stroke adjustment for numbers, underscores, and symbols

## PolyDiceGenerator v0.26.6

- Added fix for quoted font names when copied from Help > Font List

## PolyDiceGenerator v0.26.5

- Added per-die size adjustment for each individual text element
- Removed pre-built distributions for simplification
- DiceLab distribution values can be found in Hidden variables section
- Variable names have changed, existing Customizer presets will be affected

## PolyDiceGenerator v0.26.4

- Added alternative shapes for d2 coin
- Added d4p a pyramid shaped d4
- Added BOSL2 library v2.0.402

## PolyDiceGenerator v0.26.3

- Added per-die vertical push, horizontal push, and depth arrays allowing adjustment of individual elements

## PolyDiceGenerator v0.26.2

- Added d2 - a two sided coin
- Added rotation adjustment for pip symbols
- Added d4c pips and pip symbol option
- Fixed d00 hard coded "0" bug

## PolyDiceGenerator v0.26.1

- Added d00 #10 horizontal push and padding adjustments if using angled numbers

## PolyDiceGenerator v0.26.0

- Changed edge rounding and number spacing to sliders allowing decimal values in Customizer
- Added underscore horizontal push adjustment
- Added corner rounding adjustment
- Added corner clipping adjustment

## PolyDiceGenerator v0.25.1

- Added bosl version echo
- Updated bosl link to installation section

## PolyDiceGenerator v0.25.0

- Renamed project to PolyDiceGenerator
- Pushed project to github
- Created documentation [README.md](README.md)
- Due to recent BOSL2 updates v2.0.402 is currently required
- Readded option for d00 symbols
- Updated kerning to scale as a % of number size

## DiceRPGenerator v0.24.3 (2020-08-25)

- Fixed d12 #8 rotation

## DiceRPGenerator v0.24.2 (2020-08-24)

- Moved number spacing and number 4 horizontal push to per dice settings
- Fixed d6 and d8 kerning

## DiceRPGenerator v0.24.1

- Fixed rotations broken after BOSL2 update - v2.0.402 is required
- Added d6 corner rounding - by Maryanne DellaSalla
- Added selector for "Standard N+1", "DiceLab", and "Custom" distributions
- Workaround for Customizer bug when symbol "undef" entries become quoted
- Symbols now override number values - no need to blank out numbers when adding symbols
- Added adjustments for symbol size, vertical push, and horizontal push
- Added double digit number spacing adjustment...kerning
- Added horizontal number push adjustment
- Added additional horizontal push adjustment for number 4s
- Readded underscore size and push adjustments

## DiceRPGenerator v0.23.1

- Variable rewrite for better Customizer usage
- Fixed symbols as pips Customizer bug
- Added d10 and d00 length adjustment
- Merged Number depth into a single variable

## DiceRPGenerator v0.22

- Updated numbering to DiceLab layout <http://thedicelab.com>
- Added d4c - a crystal shaped d4
- Added d4c body and point length adjustments
- Added d6 and d00 angled text option
- Added d6 pip option
- Added d6 symbols for pips option
- Added d00 "0" padding and size adjustment if using angled numbers
- Added d00 vertical adjustment if using angled numbers
- Updated underscore size and push to self-adjust with text size - works pretty well depending on font
- Removed d4 and d00 underscores

## DiceRPGenerator v0.21

- By Czertwy

## Modified

- By bronkula <https://www.thingiverse.com/thing:3472349>

## Original

- By TimEdwards <https://www.thingiverse.com/thing:1043661>
