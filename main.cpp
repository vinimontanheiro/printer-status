#include <windows.h>
#include <winspool.h>
#include <string.h>
#include <iostream>

using namespace std;

DWORD  getPrinterStatus(string printerName){
  HANDLE          hHandle = 0;   
  DWORD           dwStatus = 0;  
  DWORD           dwSize = 0;    
  PRINTER_INFO_2* pPrnInfo2 = 0; 
  DEVMODE         DevMode = {0}; 
  PRINTER_DEFAULTS PrnDef = { 0, &DevMode, PRINTER_ACCESS_USE };

  LPSTR ptr = const_cast<char*>(printerName.c_str());
  if(!OpenPrinter(ptr,&hHandle,&PrnDef)){
    return -1;
  }

  GetPrinter(hHandle,2,0,0,&dwSize);
  if( !dwSize ){
    return -1;
  }
    
  pPrnInfo2 = (PRINTER_INFO_2*)malloc(dwSize);

  if(!GetPrinter(hHandle,2,(LPBYTE)pPrnInfo2, dwSize, &dwSize)){
    return -1;
  }
 
  dwStatus = pPrnInfo2->Status;
  free(pPrnInfo2);
  ClosePrinter(hHandle);

  return dwStatus;
}

int main(){
  cout << getPrinterStatus("Brother HL-L5102DW Printer");
  return getPrinterStatus("Brother HL-L5102DW Printer");
}



