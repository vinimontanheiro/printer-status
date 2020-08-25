!include "MUI.nsh"
!include "MUI2.nsh"

!define MUI_ICON "icons\installer.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "icons\installer.bmp"
!define MUI_HEADERIMAGE_RIGHT
!define PATH "C:\PrinterStatus\"
!define UNINSTALLER "C:\PrinterStatus\Uninstall.exe"
!define INSTALLER "PrinterStatus-Installer.exe" 

Name "PrinterStatus"
OutFile "${INSTALLER}"
InstallDir "${PATH}"
DirText "Escolha o diretório de instalação"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_LANGUAGE "Portuguese"

Function Install
  SetOutPath "${PATH}\"
  File /r "getPrinterStatus.exe"
  File /r "tester.bat"
  SetOutPath "${PATH}\"  
FunctionEnd

Section
  Call Install
SectionEnd

Section
  SetOutPath PATH
  WriteUninstaller "${UNINSTALLER}"
  WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Run" \
"PrinterStatus" "${PATH}\${INSTALLER}"
SectionEnd

Section "Uninstall"
  RMDir /r /REBOOTOK "${PATH}"
  RMDir "${PATH}"
SectionEnd
