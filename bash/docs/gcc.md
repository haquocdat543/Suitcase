# GCC
### 1. Option
#### 1. Language option
* -std
  * -std=c99
#### 2. Optimization option
* -O
  * -O2 ( optimization level 2 )
* -march
* -mtune
#### 3. Debugging option
* -g
#### 4. Warning option
* -Wall
* -Wextra
#### 5. Preprocessor option
* -D
* -I
#### 6. Linker option
* -l
* -L
#### 7.Code generation option
* -m
* -f
#### 8. Dependency generation option
* -M
* -MM
#### 9. Target option
* -march
* -mcpu
#### 10. Miscallanous option
* -o ( Specify output )
* -v ( Print verbose information )
* -Wl ( Pass option linker )
### 2. Target architecture
```
gcc -march=x86-64 -mtune=generic -o output_file source_file.c
```
* mtune values can be: generic, native, core2, corei7, athlon 

### 3. Target architecture
* For x86 architecture:
```
gcc -march=i386
```
* For x86-64 architecture:
```
gcc -march=x86-64
```
* For ARM architecture:
```
gcc -march=armv7-a
```
* For AArch64 architecture:
```
gcc -march=armv8-a
```
* For sparc architecture:
```
gcc -march=sparc -o output_file source_file.c
gcc -march=sparc64 -o output_file source_file.c
```
* For powerc architecture:
```
gcc -march=powerpc -o output_file source_file.c
gcc -march=powerpc64 -o output_file source_file.c
```
* For mips architecture:
```
gcc -march=mips1 -o output_file source_file.c
gcc -march=mips2 -o output_file source_file.c
gcc -march=mips32 -o output_file source_file.c
gcc -march=mips32r6 -o output_file source_file.c
gcc -march=mips64 -o output_file source_file.c
gcc -march=mips64r2 -o output_file source_file.c
gcc -march=mips64r6 -o output_file source_file.c
```
More info
```
gcc --help=target
```
