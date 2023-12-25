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
                    ECHO Copying file to repository: %%a -> %%b
                    COPY "%%a" "%%b"
                )
                ECHO Creating symlink: %%a -> %%b
                MKLINK "%%a" "%%b"
                IF ERRORLEVEL 1 (
                    ECHO Failed to create symlink for %%a
                ) ELSE (
                    ECHO Symlink created for %%a -> %%b
                )
            ) ELSE (
                IF EXIST "%%b" (
                    ECHO Error: File exists in repository but not in the original location: %%b
                ) ELSE (
                    ECHO File does not exist in both locations: %%a and %%b
                )
            )
        )
    ) ELSE (
        GOTO EndLoop
    )
)
:EndLoop

ECHO All symlinks created.
ENDLOCAL
