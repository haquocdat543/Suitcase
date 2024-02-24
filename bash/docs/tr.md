# tr

```
cat greekfile
```

Output:
```
WELCOME TO 
GeeksforGeeks
```

### 1. Transform lowercase to uppercase
```
cat greekfile | tr [a-z] [A-Z]
cat greekfile | tr [:lower:] [:upper:]
tr [:lower:] [:upper:] < greekfile
```

Output:
```
WELCOME TO 
GEEKSFORGEEKS
```

### 2. Transform white space to \t
```
echo "Welcome To GeeksforGeeks" | tr [:space:] "\t"
tr [:space:] "\t" <<< "Welcome To GeeksforGeeks"
```

Output:
```
Welcome    To    GeeksforGeeks
```

### 3. Transform braces into parenthesis
Source:
```
{WELCOME TO} 
GeeksforGeeks
```

```
tr "{}" "()" <greekfile >newfile.txt
```

Output:
```
Welcome    To    GeeksforGeeks
```

### 4. Squeeze a sequence of repetitive characters using -s option
```
echo "Welcome    To    GeeksforGeeks" | tr -s " "
tr -s " " <<< "Welcome    To    GeeksforGeeks"
```

Output:
```
Welcome To GeeksforGeeks
```

### 5. How to delete specified characters using -d option
```
echo "Welcome To GeeksforGeeks" | tr -d W
tr -d W <<< "Welcome to GeeksforGeeks"
```

Output:
```
elcome To GeeksforGeeks
```

### 6.Remove all the digits from the string 
```
echo "my ID is 73535" | tr -d [:digit:]
tr -d [:digit:] <<< "my ID is 73535"
```

Output:
```
my ID is
```
### 7.complement the sets using -c option
```
echo "my ID is 73535" | tr -cd [:digit:]
tr -cd [:digit:] <<< "my ID is 73535"
```

```
73535
```
