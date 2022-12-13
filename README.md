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
requires `cmake` to be installed. This builds the full `libraylib.so` on
Linux, but **on Windows this does not actually build Raylib**. Only a
`raylib.sln` will be generated, which you need to open in Visual Studio,
set the build target to `RelWithDebInfo`, right click the `raylib` project
in the solution inspector, and click `Build`. If you want to build for a
different target (say `Release` or `Debug`) simply edit the appropriate
library path in `generate.jai` before generating the bindings, as Visual
Studio outputs the `.lib/.dll` into a different directory.

Generating the bindings and building examples works the same way on both
Linux and Windows, the only additional step required on Windows is
building `raylib` manually with Visual Studio.

If you do not have the Visual C++ SDK installed, opening the `.sln` in
Visual Studio should automatically prompt you to install it (tested on
Windows 11 with Visual Studio 2022).

## Generating Bindings

To generate the bindings simply run `jai generate.jai`. Generating the
bindings is not required as the generated bindings are already in this
repo. That being said since we're tracking Raylib 4.5-dev, which is
essentially the master branch, there could be API changes. It's a good
idea to re-generate the bindings after building Raylib and check `git
diff` to see if any API changed.

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

## Included Binaries

This repo also embeds compiled binaries for Raylib. **I stronly recommend you
build your own, do not trust random binaries found on the internet.** The
binaries are embedded in the repository only for my own convenience, and not
meant for others to use. I provide absolutely no guarantee about compiled
library binaries in this repo. **Please use the above mentioned scripts to build
Raylib yourself from source, it only takes a minute and you have a guarantee
that there's no nasty stuff.**

If you don't want to build Raylib yourself, you could try using the [official
pre-compiled binaries from the Raylib
Repo](https://github.com/raysan5/raylib/releases/tag/4.2.0). Note that you'll
need to check-out the same version in the Raylib submodule as the binary you
downloaded, otherwise things might not work. I'm happy to accept a PR that
automates the process of downloading the precompiled binaries from official
Raylib releases and generates the appropriate bindings.

If someone figures out how to use Github Actions to build Jai code without
exposing the private compiler I'd be happy to change this repo to build
everything in CI and put it in Github Releases.

I'm happy to accept a PR that implements Github Actions setup to build
everything from source in a way that does not expose the compiler to the
public.

But until then, we're left to build everything from source.

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
