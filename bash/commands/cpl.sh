#!/bin/bash

read -p "Enter your asm file name [test]: " filename
filename=${filename:-test}
nasm -felf64 $filename.asm && ld $filename.o -o $filename && ./$filename
