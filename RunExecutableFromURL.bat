:: Script Name: RunExecutableFromURL.bat
:: Author: Johan Koolen - https://github.com/SuperJohan64
:: Date Created: May 02, 2018
:: Last Motified: January 19, 2020
:: Purpose: Downloads an executable and runs it with optional arguments.

:: Sets the file name of the download. When This script downloads a file, it does not automatically name it like
:: a browser would so we must specify a name. It is recomended to use the same name the file is given when you
:: download it via a webbrowser.
set FileName=7z1900-x64.exe

:: Tells the script which URL to download the file from.
set FileURL=https://www.7-zip.org/a/7z1900-x64.exe

:: Optional command line arguments used for installing the software. This field can be left blank.
set InstallArguments=/S

:: Calls Powershell from CMD and downloads the file used for installation. Note that since we're calling
:: Powershell in CMD, we must use CMD syntax for variables. The package will be downloaded to the the user's
:: AppData\Local\Temp directory.
@powershell.exe -NoProfile -ExecutionPolicy -Bypass -Command (New-Object Net.WebClient).DownloadFile('%FileURL%','%TEMP%\%FileName%')

:: Runs the installation with the specified arugments.
%TEMP%\%FileName% %InstallArguments%

PAUSE
EXIT