# LJ Archiver

LJ Archiver is an offline LiveJournal archiver written in C17.

The application downloads blog data, parses HTML pages and stores all information in a local SQLite database for long-term archival.

## Stack

```text
Language            C17
Build System        CMake
Generator           Ninja
Compiler            MSVC (Visual Studio 2022)
Package Manager     vcpkg
Testing             CTest
```

## Requirements

- Visual Studio 2022
- CMake 4.0+
- Ninja
- Git
- vcpkg

## Features

- Modular architecture
- Modern CMake build system
- CTest integration
- Configurable compiler warnings
- Optional static analysis support
- Optional AddressSanitizer support

## Project Structure

```text
app/        Application entry point
archive/    High-level archive workflow
cmake/      Custom CMake modules
config/     Configuration management
docs/       Project documentation
html/       HTML processing
http/       HTTP communication
include/    Public API headers
logger/     Logging subsystem
parser/     LiveJournal content parser
scripts/    Project utility scripts
storage/    Data storage layer
tests/      Unit tests
util/       Shared utility functions
```

## Project Modules

```text
Archive     High-level archive workflow
HTTP        HTTP communication
HTML        HTML processing
Parser      LiveJournal content parser
Storage     Data storage layer
Logger      Logging subsystem
Config      Configuration management
Utility     Shared utility functions
```

## Build Configurations

The project provides two build configurations:

- **Debug (`x64-Debug`)**
  - Debug symbols
  - AddressSanitizer support
  - Intended for development

- **Release (`x64-Release`)**
  - Compiler optimizations enabled
  - Sanitizers disabled
  - Intended for production builds

## Running Tests

```shell
ctest --test-dir out/build/x64-Debug
ctest --test-dir out/build/x64-Release
```

## Build Configuration

```text
LJ_ENABLE_TESTS             Build the project test suite               ON
LJ_ENABLE_SANITIZERS        Enable AddressSanitizer in Debug builds    OFF
LJ_ENABLE_CLANG_TIDY        Enable clang-tidy analysis                 OFF
LJ_ENABLE_CPPCHECK          Enable cppcheck analysis                   OFF
LJ_WARNINGS_AS_ERRORS       Treat compiler warnings as errors          OFF
```

## Project Scripts

```text
new-module.ps1    Creates a new project module using the standard layout.
```