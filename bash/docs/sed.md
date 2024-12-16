# Sed

### 1. First match in one line in whole file
```bash
sed 's/unix/linux/' file.txt
```

### 2. Specific match in one line whole file
```bash
sed 's/unix/linux/2' file.txt
```
### 3. Whole file
```bash
sed 's/unix/linux/g' file.txt
```

### 4. From specific line to end
```bash
sed 's/unix/linux/3g' file.txt
```

### 5. Parenthesize first character of each word
```bash
echo "Welcome To The Geek Stuff" | sed 's/\(\b[A-Z]\)/\(\1\)/g'
```

### 6. Specific line
```bash
sed '3 s/unix/linux/' file.txt
```

### 7. Duplicate lines has match 
```bash
sed 's/unix/linux/p' file.txt
```

### 8. Print duplicated lines
```bash
sed -n 's/unix/linux/p' file.txt
```

### 9. On a range of lines
```bash
sed '1,3 s/unix/linux/' file.txt
sed '1,$ s/unix/linux/' file.txt
```
