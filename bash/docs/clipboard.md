# CLIPBOARD

## 1. Installation
All except Window:
```bash
curl -sSL https://github.com/Slackadays/Clipboard/raw/main/install.sh | sh
```

Window:
```powershell
(Invoke-WebRequest -UseBasicParsing https://github.com/Slackadays/Clipboard/raw/main/install.ps1).Content | powershell
```

MacOS:
```bash
brew install clipboard
```

Scoop:
```bash
scoop install clipboard
```

Install from source:
```bash
git clone https://github.com/Slackadays/Clipboard 
cd Clipboard/build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . -j 12
cmake --install .
```

## 2. Usage
Let's start by copying a file.
```bash
cb copy NuclearLaunchCodes.pdf
```

Now, let's paste this file.
```bash
cb paste
```

Let's make a note for this clipboard.
```bash
cb note "Keep this a secret"
```

What if you wanted to pipe the note in?
```bash
echo "Keep this a secret OR ELSE" | cb note
```

Now let's cut a directory to a different clipboard. We put the 69 right after "cut" to tell CB to put MyDirectory in clipboard 69.
```bash
cb cut69 MyDirectory
```

Let's add a file to this same clipboard.
```bash
cb add69 SomeFile
```

To remove a file, enter its name to remove just that file.
```bash
cb remove69 SomeFile
```

Alternatively, you can put in a regex pattern instead to generalize the removal.
```bash
cb remove69 "So.*le"
```

Finally, let's paste what we have in clipboard 69.
```bash
cb paste69
```

Let's try the "_420" persistent clipboard for this one.
```bash
cb copy_420 foo.bar NotAVirus.bar.mp3.exe
```

Like before, we can remove anything with a regex patttern.
```bash
cb remove_420 "*.mp3\.exe"
```

Notes work exactly the same way for every clipboard.
```bash
cb note_420 "Some kosher content here"
```

Let's look at everything we've stored in clipboard _420.
```bash
cb show_420
```

Now let's see our original note and then clear that clipboard. 
```bash
cb note
cb clear
```

This is the same as "cb note" but for clipboard "_420" again.
```bash
cb note_420
```

Let's shake things up. Say you have some kind of content you want to ignore. This content could be anything from a password to raw binary data. To ignore certain kinds of content, use a regex pattern of your choice.

Let's try this with a classic example.
```bash
cb ignore "H.*2"
```

Now, this next command will fail because CB will ignore the content in it through the pattern.
```bash
cb copy "Hunter2"
```

Let's get some more detailed information about our clipboards.
```bash
cb info
cb info69
cb info_420
```

Doing "cb" is the exact same as "cb status."
```bash
cb status
```
