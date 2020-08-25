## Getting the Printer Status on Windows

### Outputing the main.o bytecode with x64 architecture
```
g++ main.cpp -Wall -c -g -lwinspool -m64 -o main.o
```
### Outputing the executable with dependencies
```
g++ main.o -static -static-libgcc -static-libstdc++ -lwinspool -o getPrinterStatus.exe
```

### Generating the Installer with NSIS
  1. Download [NSIS](https://nsis.sourceforge.io/Download) 
  2. Select the setup.nsi in the project source
  3. Press the compile button on NSIS
  4. The installer PrinterStatus-Installer.exe will generated

### Windows Printer Status Enumerator

![PrinterStatusEnum](https://raw.githubusercontent.com/vmontanheiro/printer-status/master/icons/status.png)

- [More info](https://docs.microsoft.com/pt-br/dotnet/api/system.printing.printqueuestatus?view=netcore-3.1)



