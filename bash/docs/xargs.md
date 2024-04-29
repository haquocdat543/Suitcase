# XARGS 

### 1. Options
#### 1. -0 
The `-0` option with xargs is used to handle input lines terminated by a null character (`\0`) instead of the usual newline (`\n`) character. 
```
touch "file with spaces.txt" "another file.txt"
```

Without null ternimator
```
find . -type f | xargs echo
```
```
./file
with
spaces.txt
./another
file.txt
```

With null ternimator
```
find . -type f -print0 | xargs -0 echo
```
```
./file with spaces.txt ./another file.txt
```

#### 2. -n 
The -n option in xargs specifies the maximum number of arguments that xargs should use for each command it executes. 
```
touch file1.txt file2.txt file3.txt file4.txt file5.txt
```

Without `-n 2`:
```
ls | xargs echo
```
```
file1.txt
file2.txt
file3.txt
file4.txt
file5.txt
```

With `-n 2`:
```
ls | xargs -n 2 echo
```
```
file1.txt file2.txt
file3.txt file4.txt
file5.txt
```

#### 3. -I
* -I {}
* -I %
* Both above are the same.

```
find . -type f -print0 | xargs -0 -I {} mv {} backup/$(date +%Y%m%d%H%M%S)-{}
```

```
ls | xargs -I % echo "Processing file: %"
```

