# GCC
### Build gcc from source 
#### 1. Preqrequisite
* gcc ( you need a chicken to have an egg =)) )
* dependencies
```bash
yum -y install pkgconfig automake gcc zlib-devel pcre-devel xz-devel
yum -y groupinstall "Development Tools"
yum -y install pcre-devel xz-devel zlib-devel
```
#### 2. Build
```bash
./contrib/download_prerequisites
```

```bash
./configure --prefix=/usr/local/bin --disable-multilib
```
Only C
```bash
./configure --prefix=/usr/local/bin --disable-multilib --enable-languages=c
```
make
```bash
make
```
or
```bash
make -j6
```
`-j6` mean six processes run parallel. You can replace `6` with any number you want.

install
```bash
make install
```
#### 3. Result
The build process took me approx `one and half an hour`
* In `usr/local/bin` we have new folders and files:
  * bin
    * c++
    * cpp
    * g++
    * gcc
    * gcc-ar
    * gcc-nm
    * gcc-ranlib
    * gcov
    * gcov-dump
    * gcov-tool
    * lto-dump
    * x86_64-pc-linux-gnu-c++
    * x86_64-pc-linux-gnu-cpp
    * x86_64-pc-linux-gnu-g++
    * x86_64-pc-linux-gnu-gcc
    * x86_64-pc-linux-gnu-gcc-14.0.1
    * x86_64-pc-linux-gnu-gcc-ar
    * x86_64-pc-linux-gnu-gcc-nm
    * x86_64-pc-linux-gnu-gcc-ranlib
  * include
    * c++
      * 14.0.1
        * ...
  * lib
  * lib64
  * libexec
  * share
    * gcc-14.0.1
    * info
      * dir
    * locale
    * man
      * man1
      * man7
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
* -save-temps ( preserve .o .i .s files )
### 2. Target architecture
```bash
gcc -march=x86-64 -mtune=generic -o output_file source_file.c
```
* mtune values can be: generic, native, core2, corei7, athlon 

### 3. Target architecture
* For x86 architecture:
```bash
gcc -march=i386
```
* For x86-64 architecture:
```bash
gcc -march=x86-64
```
* For ARM architecture:
```bash
gcc -march=armv7-a
```
* For AArch64 architecture:
```bash
gcc -march=armv8-a
```
* For sparc architecture:
```bash
gcc -march=sparc -o output_file source_file.c
gcc -march=sparc64 -o output_file source_file.c
```
* For powerc architecture:
```bash
gcc -march=powerpc -o output_file source_file.c
gcc -march=powerpc64 -o output_file source_file.c
```
* For mips architecture:
```bash
gcc -march=mips1 -o output_file source_file.c
gcc -march=mips2 -o output_file source_file.c
gcc -march=mips32 -o output_file source_file.c
gcc -march=mips32r6 -o output_file source_file.c
gcc -march=mips64 -o output_file source_file.c
gcc -march=mips64r2 -o output_file source_file.c
gcc -march=mips64r6 -o output_file source_file.c
```
More info
```bash
gcc --help=target
```
## Autotools
### 1. Prerequisites
* configure.ac in main directory
```bash
~/amhello % cat configure.ac
AC_INIT([amhello], [1.0], [bug-automake@gnu.org])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CC
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([
 Makefile
 src/Makefile
])
AC_OUTPUT
```
* Makefile.am in main directory
```bash
SUBDIRS = src
dist_doc_DATA = READMEé
```
* Makefile.am in sub directory
```bash
bin_PROGRAMS = hello
hello_SOURCES = main.cé
```
