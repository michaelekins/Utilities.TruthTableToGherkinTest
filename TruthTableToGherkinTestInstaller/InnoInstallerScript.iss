; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "TruthTableToGherkinTestUtility"
#define MyAppVersion "1"
#define MyAppPublisher "Michael Ekins"
#define MyAppURL "https://www.michaelekins.co.uk"
#define MyAppExeName "TruthTableToGherkinTest.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{CAD9F85C-F490-4F14-A929-6E42AC3F248D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\Utilities\Truth Table To Gherkin Test
DisableProgramGroupPage=yes
LicenseFile={#SourcePath}..\LICENSE
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
Compression=lzma
SolidCompression=yes
WizardStyle=modern
OutputBaseFilename=TruthTableToGherkinTestInstaller
SetupIconFile="{#SourcePath}..\TruthTableToGherkinTest\gherkinTestFromTruthTableLogo.ico"
VersionInfoVersion=1.0.0.0

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#SourcePath}..\TruthTableToGherkinTest\bin\Release\netcoreapp3.1\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}..\TruthTableToGherkinTest\bin\Release\netcoreapp3.1\LumenWorks.Framework.IO.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

