# My Dotfiles

This repository contains my personal configuration files (dotfiles) for various tools and applications. Cloning and setting up these dotfiles on a new machine allows for a quick and consistent environment setup.

Inspired by [ThePrimeagen](https://www.youtube.com/@ThePrimeagen)'s setup stream

[![ThePrimeagen Stream](https://i.ytimg.com/vi/GXxvxSlzJdI/hqdefault.jpg)](https://www.youtube.com/watch?v=GXxvxSlzJdI)

# Cloning the Repository

To get started, clone this repository to your home directory or the root of your C: drive. 

For cloning to the home directory, use:

```bash
git clone https://github.com/Sam-Hedges/.dotfiles.git ~
```

For cloning to the C: drive, use:

```bash
git clone https://github.com/Sam-Hedges/.dotfiles.git C:\
```

# Customizing the Setup Script
After cloning, you'll need to set up symbolic links from the dotfiles in this repository to their expected locations. This is done through a bootstrap script included in the repository.

The setup.bat script is designed to be flexible and can be customized to handle different dotfiles. To include your own dotfiles in the setup process, you need to modify the script by adding or changing lines that specify the dotfiles' locations.

### Replace the following three paths with the corresponding directories:

```bat
SET dotfilesRepoPath=C:\.dotfiles
SET yourDrive=C:
SET yourUsername=samhe
```

### Each dotfile is set up in the script using the following format:

```bat 
SET dotfiles[index]=OriginalFilePath=!dotfilesRepoPath!\FileNameInRepo
``` 
- **index:** A unique number for each dotfile (e.g., [0], [1], [2], etc.).
- **OriginalFilePath:** The path where the dotfile is usually located on your system.
- **FileNameInRepo:** The name of the file as it will be stored in your dotfiles repository.

## Example

Suppose you want to add a new dotfile, such as .bashrc, to the script. Let's say your username is yourUsername, and your dotfiles repository path is set to C:\.dotfiles. You would add the following line to the script:

```bat 
SET dotfiles[2]=%yourDrive%\Users\%yourUsername%\.bashrc=!dotfilesRepoPath!\.bashrc
``` 

Here, [2] is the index for the new entry (assuming you already have [0] and [1] set up for other dotfiles). Adjust the index accordingly based on how many dotfiles you're managing.

## Steps to Customize
1. Open the setup.bat script in a text editor.
2. Identify the section where dotfiles are defined (look for lines beginning with SET dotfiles).
3. Add or modify the lines with the format mentioned above, according to your dotfiles and their locations.
4. Save the script after making your changes.

By customizing the script in this way, you can manage any number of dotfiles and ensure that they are properly linked and synchronized with your repository. Remember to run the script again after making changes to apply the new configuration.

## Windows Users
Run the Setup Script:

A batch script named setup.bat is included in the repository.
Right-click on this file and select "Run as administrator" to execute it.
This script will check for dotfiles in their usual locations and will:
Copy them to the repository if they don't exist there.
Create symbolic links in their original locations pointing to the files in the repository.
This ensures that your system uses the configurations from the repository.

## Linux/Mac Users
Run the Setup Script:

Open a terminal and navigate to the cloned repository.
Run the script with ./setup.sh (ensure it's executable with chmod +x setup.sh).
This script will similarly create symbolic links to the appropriate locations.

# Making Changes
Feel free to modify the dotfiles as per your preferences. After making changes, don't forget to commit and push them back to the repository so that you can pull these changes on other machines.

# Pulling Updates
To update your dotfiles with the latest changes from the repository:

Navigate to the cloned repository directory.
> Pull the latest changes using **git pull***.