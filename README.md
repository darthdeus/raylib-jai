# Raylib 4.5-dev bindings for Jai

Based off of https://github.com/shiMusa/Raylib-Jai, the goal of these bindings
is to track Raylib 4.5 and provide an easy way to build Raylib from source with
git submodules. This allows easier patching of Raylib instead of introducing an
external build setup.

All commands related to this repo are bundled in a single `Makefile`. Windows
users can either install make and run it under `git-bash.exe` or MSYS2 or
something similar, or simply consult the `Makefile` and run said commands
manually. There's no advanced command line magic, the point of the Makefile
is to simply group related commands together for better discoverability.

TODO:

- [x] raylib
- [ ] port raylib examples
- [ ] raymath
- [ ] raygui
- [ ] rlgl

## Building Raylib

To build raylib from source simply run `make build-raylib`. Note that this
requires `cmake` to be installed.

## Generating Bindings

To generate the bindings simply run `jai generate.jai`.

## Examples

To compile the examples run `make examples`, the `examples` folder then
contains compiled binaries for all the examples in the project.

<!-- TODO: add this once things are verified to work -->
<!-- The `examples/core` folder currently contains a verbatim copy of the -->
<!-- `examples/core` folder from raylib itself. The license for said `.c` and `.png` -->
<!-- files is available in `raylib/LICENSE`. The reason for this is to enable easier -->
<!-- porting of the examples to Jai without the need to track a moving target. -->
<!--  -->
<!-- This way whenever the examples need to be updated we can copy them from the -->
<!-- raylib repo, and update the Jai versions based on the actual diff since the -->
<!-- last time the examples were created. -->

## ORIGINAL README (TODO update)

This binding is created using the `Bindings_Generator` module of the compiler,
plus a few minor tweaks and additions.

`raylib.[dll/lib]`, `raylibdll.lib` (depending on your system) has to be placed
next to the executable.

Tested on Windows 11 x86-64 so far. If anyone has macOS or Linux, feel free to
generate bindings for that system and add them to this repository. Just add the
dynamic libraries and `raylib.h` to the folder and run `first.jai`. You might
need to make some adjustments to the generated bindings, such as those added to
`raylib.jai`.
