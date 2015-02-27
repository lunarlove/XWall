; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "X-Wall"
#define MyAppExeName "x-wall.exe"
#define MyAppVersion GetFileVersion("E:\WorkSpace\XWall\src\bin\Release\x-wall.exe")
#define MyAppPublisher "LunaTech Inc."
#define MyAppURL "https://github.com/lunarlove/XWall"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={{CEE80EAA-3CD9-425B-8119-F3ECBCB5DB52}
AppName={#MyAppName}
AppVerName={#MyAppName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppVersion={#MyAppVersion}
VersionInfoVersion={#MyAppVersion}
VersionInfoTextVersion={#MyAppVersion}
VersionInfoCompany={#MyAppPublisher}
VersionInfoCopyright={#MyAppPublisher}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=E:\WorkSpace\XWall\release
OutputBaseFilename=x-wall-setup
SetupIconFile=E:\WorkSpace\XWall\src\Icons\main.ico
UninstallDisplayIcon=E:\WorkSpace\XWall\src\Icons\main.ico
Compression=lzma/Max
SolidCompression=true

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "zh"; MessagesFile: "compiler:Languages\Chinese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "E:\WorkSpace\XWall\src\bin\Release\x-wall.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\WorkSpace\XWall\src\bin\Release\x-wall.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\WorkSpace\XWall\src\bin\Release\WebDev.WebHost20.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\WorkSpace\XWall\src\bin\Release\mgwz.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\WorkSpace\XWall\src\bin\Release\plink.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\WorkSpace\XWall\src\bin\Release\plonk.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\WorkSpace\XWall\src\bin\Release\privoxy.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\WorkSpace\XWall\local-server-apps\*"; DestDir: "{commonappdata}\{#MyAppName}\local-server-apps"; Flags: ignoreversion recursesubdirs
Source: "E:\WorkSpace\XWall\src\resources\*"; DestDir: "{commonappdata}\{#MyAppName}\resources"; Flags: ignoreversion recursesubdirs
Source: "E:\WorkSpace\XWall\rules\rules-v2"; DestDir: "{commonappdata}\{#MyAppName}\configs"; DestName: "online-rules"; Flags: ignoreversion; Permissions: authusers-full

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: nowait postinstall runascurrentuser

#include "scripts\products.iss"

#include "scripts\products\stringversion.iss"
#include "scripts\products\winversion.iss"
#include "scripts\products\fileversion.iss"
#include "scripts\products\dotnetfxversion.iss"

#include "scripts\products\msi31.iss"
#include "scripts\products\dotnetfx35sp1.iss"

[Registry]
Root: "HKCR"; Subkey: "xwall"; Flags: deletekey

[InstallDelete]
Type: files; Name: "{commondesktop}\{#MyAppName}.lnk"
Type: filesandordirs; Name: "{app}\templates"
Type: filesandordirs; Name: "{app}\local-server-apps"
Type: filesandordirs; Name: "{app}\configs"
Type: filesandordirs; Name: "{app}\resources"
Type: files; Name: "{app}\online-rules"
Type: files; Name: "{app}\update-mark"
Type: files; Name: "{app}\privoxy.config"
Type: files; Name: "{app}\privoxy.action"

[CustomMessages]
win_sp_title=Windows %1 Service Pack %2

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
Type: filesandordirs; Name: "{commonappdata}\{#MyAppName}"

[Dirs]

[Code]
Function InitializeSetup : Boolean;
var
  ResultCode : Integer;
begin
	initwinversion();
	msi31('3.1');
	dotnetfx35sp1();
  Result := true;
end;

Function InitializeUninstall : Boolean;
var
  ResultCode : Integer;
begin
  Exec(ExpandConstant('{app}\x-wall.exe'),'uninstall', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  Result := true;
end;
