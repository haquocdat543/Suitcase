# GREP

## USAGE
```
grep [OPTION] PATTERN FILE
```
## 1. OPTIONS
#### 1. [ -i ] Case-insensitive search: Ignores case distinctions in both the pattern and input data.
```
grep -i "hello"myfile.txt
```
Example: grep -i "hello"myfile.txt will find lines containing "Hello", "hELLO", "hEllo WorlD", etc
#### 2. [ -v ] Invert match: Displays lines that do not contain the pattern.
```
grep -v "error" system.log
```
Example: grep -v "error" system.log will show lines that don't have the word "error".
#### 3. [ -n ] Line number: Prefix each matching line with its line number in the file.
```
grep -n "warning" script.sh
```
Example: grep -n "warning" script.sh will display line numbers and lines containing "warning"
#### 4. [ -w ] Whole word match: Only match lines where the pattern is a whole word, not part of a larger word
```
grep -w "root" passwd
```
Example: grep -w "root" passwd will only find lines with "root" as a separate word, not "rootkit"
#### 5. [ -n ] Count: Count the number of lines containing the pattern instead of displaying the lines themselves
```
grep -c "http" access.log
```
Example: grep -c "http" access.log will show the number of lines with "http"
#### 6. [ -r ] Recursive search: Search for the pattern recursively within directories and their subdirectorie
```
grep -r "config" /etc
```
Example: grep -r "config" /etc will search for "config" in the entire "/etc" directory tree
#### 7. [ -C n ] This option displays a specified number of lines before and after each line containing the search pattern.
```
grep -C 2 "error" system.log
```
Example: grep -C 2 "error" system.log will display each line containing "error" in the system.log file, along with the two lines preceding and following it
#### 8. [ -e or | ] This options allows you to specify multiple search patterns in a single command.
```
grep -e "error" -e "warning" system.log
```
grep -e "error" -e "warning" system.log will find lines containing either "error" or "warning" in the system.log file.
```
grep "root|user" /etc/passwd
```
grep "root|user" /etc/passwd will find lines containing either "root" or "user" in the /etc/passwd file

#### 9. [ -E ] also known as --extended-regexp, enables the use of extended regular expressions for pattern matching
Basic regular expression: grep 'ab' file.txt (Searches for the literal string "ab" in "file.txt")
```
grep 'ab' file.txt 
```
Extended regular expression with -E: grep -E '[0-9]{3}-[0-9]{3}-[0-9]{4}' file.txt (Searches for phone numbers in the format XXX-XXX-XXXX using character classes and backreferences)
```
grep -E '[0-9]{3}-[0-9]{3}-[0-9]{4}'
```
