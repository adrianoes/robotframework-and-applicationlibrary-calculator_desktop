# robotframework-and-applicationlibrary-calculator_desktop

Desktop testing in Windows Calculator app. This project contains basic examples on how to use Robot Framework and ApplicationLibrary to execut desktop automated tests in Windows Calculator app. Good practices such as hooks, custom commands and tags, among others, are used. All the necessary support documentation to develop this project is placed here.

# Pre-requirements:

| Requirement                     | Version         | Note                                                            |
| :------------------------------ |:----------------| :-------------------------------------------------------------- |
| Windows SDK for Windows 11      | 10.0.26100.4188 | -                                                               |
| WinAppDriver.exe                | 1.2.99          | -                                                               |
| Python                          | 3.13.4          | -                                                               |
| Visual Studio Code              | 1.89.1          | -                                                               |
| Robot Framework                 | 7.3.2           | -                                                               | 
| ApplicationLibrary              | 1.2.1           | -                                                               | 
| robotframework-faker            | 5.0.0           | -                                                               |
| Appium-Python-Client            | 1.3.0           | -                                                               |
| Selenium                        | 3.141.0         | -                                                               |
| urllib3                         | 1.26.16         | -                                                               |
| setuptools                      | 80.9.0          | -                                                               |  
| Robot Framework Language Server | 1.13.0          | -                                                               |

# Installation:

- See [Windows SDK archive](https://developer.microsoft.com/en-us/windows/downloads/sdk-archive/) and download the last compatible version of the Windows SDK archive. Double click it to start installation. Keep it all the preferenced options as they are. 
- See [python page](https://www.python.org/downloads/) and download the latest Python stable version. Start the installation and check the checkboxes below: 
  - :white_check_mark: Use admin privileges when installing py.exe 
  - :white_check_mark: Add python.exe to PATH
choose C:\Python313 as the installation path and keep all the other preferenced options as they are.
- See [Visual Studio Code page](https://code.visualstudio.com/) and install the latest VSC stable version. Keep all the prefereced options as they are until you reach the possibility to check the checkboxes below: 
  - :white_check_mark: Add "Open with code" action to Windows Explorer file context menu. 
  - :white_check_mark: Add "Open with code" action to Windows Explorer directory context menu.
Check then both to add both options in context menu.
- Open Windows Command Prompt as admin and execute ```pip install robotframework``` to install Robot Framework.
- Open Windows Command Prompt as admin and execute ```pip install robotframework-applicationlibrary``` to install the ApplicationLibrary.
- Open Windows Command Prompt as admin and execute ```pip install Appium-Python-Client==1.3.0``` to install Appium Python Client version 1.3.0.
- Open Windows Command Prompt as admin and execute ```pip install selenium==3.141.0``` to install Selenium version 3.141.0.
- Open Windows Command Prompt as admin and execute ```pip install urllib3<=1.26.16``` to install urllib3 up to version 1.26.16.
- Open Windows Command Prompt as admin and execute ```pip install robotframework-faker``` to install robotframework-faker.
- Open Windows Command Prompt as admin and execute ```pip install setuptools``` to install setuptools package.
- Look for Robot Framework Language Server in the extensions marketplace and install the one from Robocorp.
- Double click in inspect.exe under C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x64 directory to inspect calculator elements.
- See [WinAppDriver](https://github.com/microsoft/WinAppDriver/releases/tag/v1.2.99), download the file compatible with your system and install it keeping all the preferenced options as they are. 
- In windows config, :point_right: **System**, :point_right: **For developers** and :point_right: **Developer Mode**.
- Execute ```"C:\Program Files\Windows Application Driver\WinAppDriver.exe"``` to run WinAppDriver.exe.
- To set up GitHub Self-Hosted Runner:
  - Execute ```mkdir actions-runner; cd actions-runner``` to create and enter a folder for the runner.
  - Execute ```Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.326.0/actions-runner-win-x64-2.326.0.zip -OutFile actions-runner-win-x64-2.326.0.zip``` to download the latest runner package.
  - (Optional) Execute the checksum validation command ```if((Get-FileHash -Path actions-runner-win-x64-2.326.0.zip -Algorithm SHA256).Hash.ToUpper() -ne '<xxxxxxxxyourxxxxxfilexxxxxxxxhashxxxxxxxherexxxxxx>') { throw 'Computed checksum did not match' }``` to verify the download integrity in Powershell.
  - Execute the checksum validation command ```Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/actions-runner-win-x64-2.326.0.zip", "$PWD")``` to extract the installer.
  - Execute the command ```./config.cmd --url https://github.com/adrianoes/robotframework-and-applicationlibrary-calculator_desktop --token xxxxxxxxyourxxxxtokenxxxxherexxxxxx``` to create the runner and start the configuration experience.
  - Open PowerShell as admin and eceute the command ```Set-ExecutionPolicy RemoteSigned``` to set the execution policy correctly.
  - Navigate to C:\actions-runner by using PowerShell > Execute the command ```./run.cmd``` to run the self-hosted runner. Commit the changes and wait for the tests to start being executed.

# Tests:

- Execute ```robot -d ./results tests``` to run all tests in headless mode and store results in separated folder.
- Execute ```robot -d ./results .\tests\add.robot``` to run all the tests in the add.robot suite in headless mode and store results in separated folder.

# Support:

- [robotframework-applicationlibrary](https://pypi.org/project/robotframework-applicationlibrary/)
- [Desktop Library](https://accruent.github.io/robotframework-applicationlibrary/DesktopLibraryDocumentation.html)
- [samples](https://github.com/Accruent/robotframework-applicationlibrary/tree/master/samples)
- [FakerLibrary](https://marketsquare.github.io/robotframework-faker/)
- [String](https://robotframework.org/robotframework/latest/libraries/String.html#Remove%20String)
- [OperatingSystem](https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html)
- [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)

# Tips:

- If timeout error occurs, increase sleep between steps.  
