:: Script Name: InstallFromCloud.bat
:: Date Created: Wed 05/02/2018
:: Author: Johan Koolen
::
:: Purpose - This script was written to simplyify software installation by downloading executables from a URL and
::			 and running a silent install. To use this script for a different software package, simply change the
::			 values of the FileName, FileURL, and InstallArugment variables below.

@ECHO OFF

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