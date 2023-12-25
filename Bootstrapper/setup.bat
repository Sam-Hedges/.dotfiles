@echo off
SETLOCAL EnableDelayedExpansion

REM Define the path to your dotfiles repository
SET dotfilesRepoPath=C:\.dotfiles

SET yourDrive=C:
SET yourUsername=samhe

REM Define your dotfiles and their original locations
REM Format: "originalPath=newPathInRepo"
SET dotfiles[0]=%yourDrive%\Users\%yourUsername%\.gitconfig=!dotfilesRepoPath!\.gitconfig
SET dotfiles[1]=%yourDrive%\Users\%yourUsername%\.ideavimrc=!dotfilesRepoPath!\.ideavimrc
REM Add more dotfiles here in the same format

REM Loop through the dotfiles and create symlinks
FOR /L %%i IN (0,1,1) DO (
    IF DEFINED dotfiles[%%i] (
        FOR /F "tokens=1,2 delims==" %%a IN ("!dotfiles[%%i]!") DO (
            IF EXIST "%%a" (
                IF NOT EXIST "%%b" (
                    ECHO Backing up file: %%a -> %%a.bak
                    COPY "%%a" "%%a.bak"
                    ECHO Creating symlink: %%a -> %%b
                    DEL "%%a"
                    MKLINK "%%a" "%%b"
                    IF ERRORLEVEL 1 (
                        ECHO Failed to create symlink for %%a
                    ) ELSE (
                        ECHO Symlink created for %%a -> %%b
                        ECHO Restoring file from backup: %%a.bak -> %%b
                        COPY "%%a.bak" "%%b"
                        DEL "%%a.bak"
                    )
                ) ELSE (
                    ECHO Deleting original file and creating symlink: %%a -> %%b
                    DEL "%%a"
                    MKLINK "%%a" "%%b"
                    IF ERRORLEVEL 1 (
                        ECHO Failed to create symlink for %%a
                    ) ELSE (
                        ECHO Symlink created for %%a -> %%b
                    )
                )
            ) ELSE (
                ECHO Error: File does not exist in the original location: %%a
            )
        )
    ) ELSE (
        GOTO EndLoop
    )
)
:EndLoop

ECHO All symlinks created.
ENDLOCAL
