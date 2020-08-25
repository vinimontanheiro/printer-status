```
g++ main.cpp -Wall -c -g -lwinspool -m64 -o main.o
```

```
g++ main.o -static -static-libgcc -static-libstdc++ -lwinspool -o getPrinterStatus.exe

```