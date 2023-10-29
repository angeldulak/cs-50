# CS50 Development Environment Setup

This script sets up a local development environment for working with C and Python on a Darwin machine with x86_64 chip architecture.

## Quick Start

1. To set up your computer, navigate into the `cs-50` directory and run:

```bash
bash infra/setup_darwin.sh
```

2. To set environment variables for compiling C source code with clang, run :

```bash
source ./set_environment_variables.sh
```

## Compiling C Source Code

When you write `C source code` you are writing a `text file` that describes the steps you want your computer to take to accomplish a task.

This text file follows `syntax rules` defined in the C programming language that makes it valid C code.

In order to **run your program** you need to **compile** your **source code** into a **binary executable file**.

The process is:

```
Source Code --> Binary Executable
```

**To compile a source code file written in C to an executable binary, run:**

```bash
clang your_file_name.c -o your_file_name.out
```

This command means: Compile the source code file names "your_file_name.c" to an executable file names "your_file_name".

## xcode Developer Tools (MacOS)

Note that any time you update your operating system to a new version of MacOS, you'll have to make sure that your developer tools are up to date:

```bash
xcode-select --install
```
