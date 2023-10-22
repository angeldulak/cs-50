#! /bin/bash

# This script sets up a local development environment for working with C and Python
# on a Darwin machine with x86_64 chip architecture.

# Install xcode developer tools - note this installs clang
if ( xcode-select --version )
then
  echo "xcode developer tools already installed 🟢"
else
  echo "Installing xcode developer tools ..."
  xcode-select --install
fi

# Install Homebrew package manager
if ( which brew > /dev/null )
then
  echo "Homebrew already installed 🟢"
else
  echo "Installing Homebrew ..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install git
if ( which git > /dev/null )
then
  echo "git already installed 🟢"
else
  echo "Installing git ..."
  brew install git
fi

# Install Visual Studio Code
if ( which code > /dev/null )
then
  echo "VS Code already installed 🟢"
else
  echo "Installing VS Code ..."
  brew install --cask visual-studio-code
fi

# Install CS50 helper C library
if [ -d "libcs50" ]
then
  echo "libcs50 already present "
else
  echo "Installing libcs50 ..."
  git clone https://github.com/cs50/libcs50.git
  pushd ./libcs50
  sudo make install
  popd

  # Add libcs50 paths to .bash_profile
  echo -e "# Add libcs50 to PATH\nexport LIBRARY_PATH=/usr/local/lib" >> ~/.bash_profile
  echo -e "export C_INCLUDE_PATH=/usr/local/include" >> ~/.bash_profile
  echo -e "export LD_LIBRARY_PATH=/usr/local/lib" >> ~/.bash_profile
fi

# Install Python3.10
if ( which python3.10 > /dev/null )
then
  echo "python3.10 already installed "
else
  echo "Installing python3.10 ..."
  brew install python@3.10
fi

# Install Poetry using the official installer
if ( which poetry > /dev/null )
then
  echo "Poetry is already installed 🟢"
else
  echo "Installing Poetry 🧙‍♂️"
  curl -sSL https://install.python-poetry.org | POETRY_VERSION=1.5.1 python3 -
fi

# Add Poetry to the path in the current user's .bash_profile
if ( poetry --version > /dev/null )
then
  echo "Poetry is already in PATH 🟢"
else
  echo -e "# Add Poetry (Python Package Manager) to PATH\nexport PATH="/Users/$USER/.local/bin:$PATH"" >> ~/.bash_profile
  source ~/.bash_profile
fi

# Configure Poetry to put build all virtual environments in the project's directory
if [ "$(poetry config virtualenvs.in-project)" == "true" ]
then
  echo "Poetry already configured to create virtual envs within projects 🟢"
else
  echo "Configuring Poetry to create virtual envs in projects 🪐"
  poetry config virtualenvs.in-project true
fi