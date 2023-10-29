#! /bin/bash

# This script sets up a local development environment for working with C and Python
# on an Ubuntu machine with x86_64 chip architecture.

# Ensure make is installed on the machine
if ( which make > /dev/null )
then
  echo "make is already installed 🟢"
else
  echo "Installing make 🔧"
  sudo apt install -y make
fi

# Install clang
if ( which clang > /dev/null )
then
  echo "clang is already installed 🟢"
else
  echo "Installing clang 🇨"
  sudo apt install -y clang
fi

# Install git
if ( which git > /dev/null )
then
  echo "git already installed 🟢"
else
  echo "Installing git ..."
  sudo apt install -y install git
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

  # Add libcs50 paths to .bashrc
  echo -e "# Add libcs50 to PATH\nexport LIBRARY_PATH=/usr/local/lib" >> ~/.bashrc
  echo -e "export C_INCLUDE_PATH=/usr/local/include" >> ~/.bashrc
  echo -e "export LD_LIBRARY_PATH=/usr/local/lib" >> ~/.bashrc
fi

# Check if software-properties-common is in the apt-cache
if ( apt-cache show software-properties-common > /dev/null )
then
  echo "software-properties-common is already cached 🟢"
else
  sudo apt update
fi

# Check for the software-properties-common requirement
if ( dpkg -L software-properties-common > /dev/null )
then
  echo "software-properties-common requirement met 🟢"
else
  echo "Installing software-properties-common 🔧"
  sudo apt install -y software-properties-common
fi

# Add this apt repository for Python 3.10
if [ -n "$(ls /etc/apt/sources.list.d | grep deadsnakes)" ]
then
  echo "ppa:deadsnakes/ppa apt repository present 🟢"
else
  echo "Adding deadsnakes to the apt-repository 💀🐍"
  sudo add-apt-repository -y ppa:deadsnakes/ppa
  # Refresh the package list again
  sudo apt update
fi

# Now you can download Python3.10
if ( which python3.10 > /dev/null )
then
  echo "Python3.10 already installed 🐍"
else
  echo "Installing Python3.10 🔧"
  sudo apt install -y python3.10
  sudo apt-get install -y gcc python3.10-dev
fi

# Verify Python3.10 installation
if ( which python3.10 > /dev/null )
then
  echo "$(python3.10 --version) 🐍 🚀 ✨"
else
  echo "Python 3.10 was not installed successfully 🔴"
fi

# Install Poetry using the official installer
if ( which poetry > /dev/null )
then
  echo "Poetry is already installed 🟢"
else
  echo "Installing Poetry 🧙‍♂️"
  curl -sSL https://install.python-poetry.org | POETRY_VERSION=1.5.1 python3 -
fi

# Add Poetry to the path in the current user's .bashrc
if ( poetry --version > /dev/null )
then
  echo "Poetry is already in PATH 🟢"
else
  echo -e "# Add Poetry (Python Package Manager) to PATH\nexport PATH="/home/$USER/.local/bin:$PATH"" >> ~/.bashrc
  source ~/.bashrc
fi

# Configure Poetry to put build all virtual environments in the project's directory
if [ "$(poetry config virtualenvs.in-project)" == "true" ]
then
  echo "Poetry already configured to create virtual envs within projects 🟢"
else
  echo "Configuring Poetry to create virtual envs in projects 🪐"
  poetry config virtualenvs.in-project true
fi