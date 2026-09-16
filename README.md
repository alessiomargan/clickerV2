# clickerV2

Firmware for the clickerV2 board, based on an STM32F407VG and a LAN9252
EtherCAT controller. The project uses CMake as the common build system for
Visual Studio Code, STM32CubeIDE, and command-line builds.

## Clone the repository

Clone the project together with its SOES and `uc-test` submodules:

```sh
git clone --recurse-submodules https://github.com/alessiomargan/clickerV2.git
cd clickerV2
```

If the repository was cloned without `--recurse-submodules`, initialize the
submodules afterward:

```sh
git submodule update --init --recursive
```

The `uc-test` submodule uses an SSH GitHub URL, so a GitHub SSH key must be
configured for the current user.

## Prerequisites

The common build requires:

- Git
- CMake 3.20 or newer
- Ninja
- GNU Arm Embedded toolchain (`arm-none-eabi-gcc`)

Optional programming and debugging tools include:

- An ST-LINK probe
- STM32CubeProgrammer
- OpenOCD or `stlink-tools`

Verify the basic tools with:

```sh
cmake --version
ninja --version
arm-none-eabi-gcc --version
```

## Command-line build

Configure and build the Debug preset:

```sh
cmake --preset Debug
cmake --build --preset Debug
```

Perform a clean rebuild with:

```sh
cmake --build --preset Debug --clean-first
```

Other available presets are `Release`, `RelWithDebInfo`, and `MinSizeRel`.
For example:

```sh
cmake --preset Release
cmake --build --preset Release
```

Debug artifacts are written to:

```text
build/Debug/clickerV2.elf
build/Debug/clickerV2.hex
build/Debug/clickerV2.bin
```

The application is linked to run from address `0x08020000`.

## Makefile shortcuts

The repository includes a convenience `Makefile` around the Debug CMake preset.
Running `make` configures the project and performs a clean Debug build:

```sh
make
```

The available targets are:

```sh
make configure       # Configure the Debug CMake preset
make build           # Configure and perform a clean Debug build
make bin             # Build and verify that clickerV2.bin was generated
make size            # Build and print the ELF section sizes
make flash           # Build and program the BIN at 0x08020000 with st-flash
make flash-openocd   # Build and program the ELF with OpenOCD
make deploy          # Copy the BIN to the local EtherCAT master firmware path
make clean           # Remove the complete build directory
```

By default, `make deploy` copies the firmware to:

```text
~/.ecat_master/firmware/st_lan9252.bin
```

Override the destination when necessary:

```sh
make deploy ECAT_FIRMWARE_DIR=/path/to/firmware
```

## Visual Studio Code setup

1. Open the repository root in Visual Studio Code.
2. Install **STM32CubeIDE for Visual Studio Code** by STMicroelectronics. A
   dedicated VS Code profile can be used to keep the STM32 extensions isolated
   from unrelated workspaces.
3. Allow the extension and CMake integration to discover the project.
4. Select the `Debug` configure preset and the `Debug` build preset when
   prompted.
5. Run **CMake: Configure**, followed by **CMake: Build** from the Command
   Palette.

The default `Ctrl+Shift+B` task also builds the selected CMake directory. The
clean and rebuild tasks are available through **Tasks: Run Task**.

For ST-LINK debugging, first configure the project so that
`${command:cmake.launchTargetPath}` resolves to `build/Debug/clickerV2.elf`.
Then start the **Debug Microcontroller - ST-Link** launch configuration. If
required by the local installation, update `.vscode/launch.json` with the MCU,
SVD, ST-LINK server, and toolchain paths.

## STM32CubeIDE setup

STM32CubeIDE 1.13 or newer supports CMake projects. This repository already
contains the Eclipse project metadata and can be imported as follows:

1. Open STM32CubeIDE and select a workspace outside this repository.
2. Select **File > Import > General > Existing Projects into Workspace**.
3. Choose the cloned `clickerV2` directory as the root directory.
4. Do not select **Copy projects into workspace**.
5. Finish the import and select the `clickerV2` project.
6. Select **Project > Build Configurations > Set Active > Debug**.
7. Open **Project Properties > C/C++ Build > CMake Settings** and verify:
   - Source directory: the repository root (`.`)
   - Build directory: `build/Debug`
   - Generator: `Ninja`
   - CMake build type: `Debug`
   - Preset: `Debug`
   - Toolchain file: `cmake/gcc-arm-none-eabi.cmake`
8. Run **CMake > Configure** from the project context menu.
9. Select **Project > Build Project**.

To force a complete rebuild, select **Project > Clean**, run
**CMake > Configure**, and then build the project again.

The checked-in `clickerV2` debug launch configuration must load:

```text
build/Debug/clickerV2.elf
```

Verify this under **Run > Debug Configurations > STM32 C/C++ Application**
before programming the target.

## Using both IDEs

VS Code and the STM32CubeIDE Debug configuration intentionally share the same
CMake preset, toolchain file, build directory, and resulting firmware:

```text
build/Debug/clickerV2.bin
```

Do not use the legacy `Debug/clickerV2.elf` or `Debug/clickerV2.bin` files.
They were produced by the previous STM32CubeIDE managed-make configuration.

The generated firmware contains build time, host, user, Git revision, and dirty
working-tree information. Consequently, two clean builds performed at different
times are not expected to be byte-for-byte identical, even when their build
configuration is otherwise the same.

## Flashing

When using `st-flash`, program the binary at the application address:

```sh
st-flash write build/Debug/clickerV2.bin 0x08020000
```

Alternatively, program `build/Debug/clickerV2.elf` through STM32CubeIDE,
STM32CubeProgrammer, or the configured VS Code debug launch.

## Updating submodules

The parent repository records exact submodule commits. To fetch the configured
tracking branches and review new revisions:

```sh
git submodule update --remote --recursive
git status
```

After testing an update, commit the changed submodule pointers in this parent
repository. Changes made inside a submodule must first be committed and pushed
from that submodule repository.

## Troubleshooting

- If CMake cannot find the compiler, ensure the directory containing
  `arm-none-eabi-gcc` is present in `PATH` before starting the IDE.
- If sources under `external/` are missing, run
  `git submodule update --init --recursive`.
- If CMake configuration is stale, remove the applicable `build/<preset>`
  directory and configure it again.
- Use only `cmake/gcc-arm-none-eabi.cmake` for this project. Do not configure a
  second toolchain file for the same build directory.
