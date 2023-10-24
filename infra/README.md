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

## xcode Developer Tools (MacOS)

Note that any time you update your operating system to a new version of MacOS, you'll have to make sure that your developer tools are up to date:

```bash
xcode-select --install
```
