# tr

```bash
cat greekfile
```

Output:
```bash
WELCOME TO 
GeeksforGeeks
```

### 1. Transform lowercase to uppercase
```bash
cat greekfile | tr [a-z] [A-Z]
cat greekfile | tr [:lower:] [:upper:]
tr [:lower:] [:upper:] < greekfile
```

Output:
```bash
WELCOME TO 
GEEKSFORGEEKS
```

### 2. Transform white space to \t
```bash
echo "Welcome To GeeksforGeeks" | tr [:space:] "\t"
tr [:space:] "\t" <<< "Welcome To GeeksforGeeks"
```

Output:
```bash
Welcome    To    GeeksforGeeks
```

### 3. Transform braces into parenthesis
Source:
```bash
{WELCOME TO} 
GeeksforGeeks
```

```bash
tr "{}" "()" <greekfile >newfile.txt
```

Output:
```bash
Welcome    To    GeeksforGeeks
```

### 4. Squeeze a sequence of repetitive characters using -s option
```bash
echo "Welcome    To    GeeksforGeeks" | tr -s " "
tr -s " " <<< "Welcome    To    GeeksforGeeks"
```

Output:
```bash
Welcome To GeeksforGeeks
```

### 5. How to delete specified characters using -d option
```bash
echo "Welcome To GeeksforGeeks" | tr -d W
tr -d W <<< "Welcome to GeeksforGeeks"
```

Output:
```bash
elcome To GeeksforGeeks
```

### 6.Remove all the digits from the string 
```bash
echo "my ID is 73535" | tr -d [:digit:]
tr -d [:digit:] <<< "my ID is 73535"
```

Output:
```bash
my ID is
```
### 7.complement the sets using -c option
```bash
echo "my ID is 73535" | tr -cd [:digit:]
tr -cd [:digit:] <<< "my ID is 73535"
```

```bash
73535
```
