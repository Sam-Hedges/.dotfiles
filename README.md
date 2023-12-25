# My Dotfiles

This repository contains my personal configuration files (dotfiles) for various tools and applications. Cloning and setting up these dotfiles on a new machine allows for a quick and consistent environment setup.

## Cloning the Repository

To get started, clone this repository to your home directory or the root of your C: drive. 

For cloning to the home directory, use:

```bash
git clone https://github.com/yourusername/dotfiles.git ~

```

For cloning to the C: drive, use:

```bash
git clone https://github.com/yourusername/dotfiles.git C:\
```

** Replace yourusername with your actual GitHub username.

## Setting Up the Dotfiles
After cloning, you'll need to set up symbolic links from the dotfiles in this repository to their expected locations.

## Windows Users
Run the Setup Script:
There's a batch script included in the repository named setup.bat.
Right-click on this file and select "Run as administrator" to execute it.
This script will automatically create the necessary symbolic links.
Linux/Mac Users
Run the Setup Script:
Open a terminal and navigate to the cloned repository.
Run the script with ./setup.sh (ensure it's executable with chmod +x setup.sh).
This script will create symbolic links to the appropriate locations.
Making Changes
Feel free to modify the dotfiles as per your preferences. After making changes, don't forget to commit and push them back to the repository so that you can pull these changes on other machines.

Pulling Updates
To update your dotfiles with the latest changes from the repository:

Navigate to the cloned repository directory.
Pull the latest changes using git pull.
