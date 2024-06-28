# DIAGRAM 

### 1. Software
Website:
* draw.io
* lucidchard.com
* eraser.io
* godiagram.com

Software:
* Visio

### 2. Scripting language
* PlantUML
* Graphviz
* Mermaid

* D2Lang
Brew:
```
brew install d2
```
Install:
```
# With --dry-run the install script will print the commands it will use
# to install without actually installing so you know what it's going to do.
curl -fsSL https://d2lang.com/install.sh | sh -s -- --dry-run
# If things look good, install for real.
curl -fsSL https://d2lang.com/install.sh | sh -s --
```
Uninstall:
```
curl -fsSL https://d2lang.com/install.sh | sh -s -- --uninstall
```
Install from source:
```
go install oss.terrastruct.com/d2
```
Try it out:
```
echo 'x -> y' > input.d2
d2 -w input.d2 out.svg
```
