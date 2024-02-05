# GCC
### Build gcc from source 
#### 1. Preqrequisite
* gcc ( you need a chicken to have an egg =)) )
* dependencies
```
yum -y install pkgconfig automake gcc zlib-devel pcre-devel xz-devel
yum -y groupinstall "Development Tools"
yum -y install pcre-devel xz-devel zlib-devel
```
#### 2. Build
```
./contrib/download_prerequisites
```

```
./configure --prefix=/usr/local/bin --disable-multilib
```
Only C
```
./configure --prefix=/usr/local/bin --disable-multilib --enable-languages=c
```
make
```
make
```
or
```
make -j6
```
`-j6` mean six processes run parallel. You can replace `6` with any number you want.

install
```
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
