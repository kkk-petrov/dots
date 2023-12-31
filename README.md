# Dotfiles Overview

This repository contains my personal dotfiles, including configurations for various tools and applications. Dotfiles are configuration files for customizing the behavior and appearance of software on a Unix-like system.

## Preview
![preview](./preview.png)

## Included Configurations

### [bspwm](https://github.com/baskerville/bspwm)
### [sxhkd](https://github.com/baskerville/sxhkd)
### [polybar](https://github.com/polybar/polybar)
### [picom](https://github.com/yshui/picom)
### [rofi](https://github.com/davatorium/rofi)
### [nitrogen](https://github.com/l3ib/nitrogen)
### [nvim (LazyVim)](https://github.com/LazyVim/LazyVim)
### [alacritty](https://github.com/alacritty/alacritty)
### [zsh](https://www.zsh.org/)
### [pfetch](https://github.com/dylanaraps/pfetch)

### Other Configurations
- **xprofile:** X11 user profile script for setting environment variables and running commands when the X session starts
- **xinitrc:** X Window System initialization script. Configures the X session when starting from the console.

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/kkk-petrov/dots.git ~/repos/dots
   ```

2. Navigate to the script directory:
   ```bash
   cd ~/repos/dots
   ```

3. Make the script executable:
   ```bash
   chmod +x install.sh
   ```

4. Run the script:
   ```bash
   ./install.sh
   ```

Review and customize the configurations before running the script to ensure compatibility with your system and preferences.

## Disclaimer
Before running the installation script, make sure that all the required packages for the configurations are installed on your system. Refer to the documentation of each tool for specific dependencies. The script does not handle package installations, and missing dependencies may lead to errors or incomplete configurations. Use these dotfiles and the installation script at your own risk. Always review and understand the configurations before applying them to your system. Make backups of existing configurations to avoid data loss.
