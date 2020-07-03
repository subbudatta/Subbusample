@echo off
echo Command called: %0 %*
:PARSE_ARGS
if /I "%~1" EQU "" (
    Powershell Write-host -BackgroundColor Red "Parsing arguments cannot be null, please pass the arguments."
    goto help
)	
if /I "%~1" EQU "--help" (
    goto help
)
if /I "%~1" EQU "--Extent" (
    set extent=%~2
	echo %extent%
) else (
    Powershell Write-host -BackgroundColor Red "Invalid Arguments Passed, Try --help for more info about passing arguments"
    goto errorWithExit
)
if /I "%~3" EQU "--xmlFilePath" (
    set xmlFile=%~4
	echo %xmlFile%
) else (
    Powershell Write-host -BackgroundColor Red "Invalid Arguments Passed, Try --help for more info about passing arguments"
    goto errorWithExit
)
if /I "%~5" EQU "--OutputDirectory" (
    set output=%~6
	echo %output%
) else (
    Powershell Write-host -BackgroundColor Red "Invalid Arguments Passed, Try --help for more info about passing arguments"
    goto errorWithExit
)
if /I "%~7" EQU "--Option" (
    set option=%~8
	echo %option%
) else (
    Powershell Write-host -BackgroundColor Red "Invalid Arguments Passed, Try --help for more info about passing arguments"
    goto errorWithExit
)
if not exist "%extent%" (
     Powershell Write-host -BackgroundColor Red "Extent File Not Found in the %extent% directory"
     goto errorWithExit
)
if not exist "%output%" (
    mkdir %output%
)



 if "%option%" EQU "1" (
 
 if not exist "%xmlFile%" (
							Powershell Write-host -BackgroundColor Red "XML File Not Found in the %xmlFile% directory"
							goto errorWithExit 
							)
 
                       )
if "%option%" EQU "2" (
 
 if not exist "%xmlFile%\*.xml" (
							 Powershell Write-host -BackgroundColor Red "XML Files Not Found in the %xmlFile% directory"
							goto errorWithExit 
							)
 
                       )
							
													
 if "%option%" EQU "1" (	
	set cmdToExecuteWithOpt1=%extent%extent -i %xmlFile% -o %output%/
	echo Command to execute: %cmdToExecuteWithOpt1%
	%cmdToExecuteWithOpt1%
)		
	
if %option% EQU "2" (
	set cmdToExecuteWithOpt2=%extent%extent -d %xmlFile%/ -o %output%/ --merge
	echo Command to execute: %cmdToExecuteWithOpt2%
	%cmdToExecuteWithOpt2%
)	
    
rem if "%option%" EQU "2"(
	rem if not exist 'dir /b "%xmlFile%\*.xml"' (
    rem Powershell Write-host -BackgroundColor Red "XML Files Not Found in the %xmlFile% directory"
    rem goto errorWithExit
rem 	)
rem )
rem if "%option%" EQU "1"(
rem set cmdToExecuteWithOpt1=%extent%  -i %xmlFile% -o %output%/
rem echo Command to execute: %cmdToExecuteWithOpt1%
rem %cmdToExecuteWithOpt1%
rem )

rem if %option% EQU "2"(
rem set cmdToExecuteWithOpt2=%extent%  -d %xmlFile%/ -o %output%/ --merge
rem echo Command to execute: %cmdToExecuteWithOpt2%
rem %cmdToExecuteWithOpt2%
rem )



:errorWithExit
exit /b 1

:help
Powershell Write-host -BackgroundColor Blue "Arguments to passed : --Extent ExtentFilePath --xmlFilePath xmlfilepath --OutputDirectory outputdirectory-path --Option optval 1or2"
Powershell Write-host -BackgroundColor Blue "There are 2 Options Available here : (1) To process single xml file ,(2) To process Multiple XML Files
Powershell Write-host -BackgroundColor Blue "Example : --Extent "C:\Users\subra\Downloads\extentreports-dotnet-cli-master\dist\extent.exe" --xmlFilePath "C:\Users\subra\Desktop\reports\result.xml" --OutputDirectory "C:\Users\subra\Desktop\reports\XMLRESULTS" --Option 1"
Powershell Write-host -BackgroundColor Blue "Example : --Extent "C:\Users\subra\Downloads\extentreports-dotnet-cli-master\dist\extent.exe" --xmlFilePath "C:\Users\subra\Desktop\reports" --OutputDirectory "C:\Users\subra\Desktop\reports\XMLRESULTS" --Option 2"
exit /b 1

