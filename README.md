# TIcli
powershell code that spawns a shell with TrustedInstaller privileges

## Requirements
- **windows**

## Usage
1. clone this repo
   ```bash
   git clone https://github.com/rooootdev/TIcli.git
   cd TIcli
   ```
2. run it using
> [!WARNING]
> You need to run powershell as admin to use TIcli  
   ```bash
   powershell.exe -ExecutionPolicy Bypass TIcli.ps1
   ```
## Issues
> [!NOTE]  
> if you encounter any other errors open an issue

- if you run it twice in the same powershell session it wont work and will output this error:
```patch
- New-Win32Process : Cannot process argument transformation on parameter 'ParentProcess'. Cannot convert the
- "System.Object[]" value of type "System.Object[]" to type "NtApiDotNet.NtProcess".
- At line:52 char:79
- + ...  New-Win32Process cmd.exe -CreationFlags NewConsole -ParentProcess $p
- +                                                                        ~~
-   + CategoryInfo          : InvalidData: (:) [New-Win32Process], ParameterBindingArgumentTransformationException
-   + FullyQualifiedErrorId : ParameterArgumentTransformationError,New-Win32Process
```
(to fix it close the current powershell window and reopen it)

*remember to star the repo!*
