# Sed

### 1. First match in one line in whole file
```
sed 's/unix/linux/' file.txt
```

### 2. Specific match in one line whole file
```
sed 's/unix/linux/2' file.txt
```
### 3. Whole file
```
sed 's/unix/linux/g' file.txt
```

### 4. From specific line to end
```
sed 's/unix/linux/3g' file.txt
```

### 5. Parenthesize first character of each word
```
echo "Welcome To The Geek Stuff" | sed 's/\(\b[A-Z]\)/\(\1\)/g'
```

### 6. Specific line
```
sed '3 s/unix/linux/' file.txt
```

### 7. Duplicate lines has match 
```
sed 's/unix/linux/p' file.txt
```

### 8. Print duplicated lines
```
sed -n 's/unix/linux/p' file.txt
```

### 9. On a range of lines
```
sed '1,3 s/unix/linux/' file.txt
sed '1,$ s/unix/linux/' file.txt
```
