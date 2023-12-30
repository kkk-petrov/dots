# Dotfiles Install Script

This script is designed to help you manage and install your dotfiles easily. It includes features for backing up existing dotfiles and installing new ones from a specified directory.

## Usage

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/kkk-petrov/dots.git ~/repos/dots
   ```

2. **Navigate to the Script Directory:**
   ```bash
   cd ~/repos/dots
   ```

3. **Make the Script Executable:**
   ```bash
   chmod +x install.sh
   ```

4. **Run the Script:**
   ```bash
   ./install.sh
   ```

## Important Note

- This script assumes that your dotfiles are stored in the `dots-local` directory. Adjust the `DOTFILES_DIR` variable in the script if your dotfiles are in a different location.

- The script will create a backup of existing dotfiles in the `dotfiles_backup` directory in your home directory.

- Customize the script according to your needs before running it. Ensure that your dotfiles are comprehensive and up-to-date in the specified directory.

## Disclaimer

Use this script at your own risk. It's recommended to review and understand the script's functionality before running it, especially if you have valuable configurations or data in your dotfiles.
