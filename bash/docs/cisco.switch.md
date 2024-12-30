# SWITCH @ CISCO

1. ## VARIABLES
```bash
PORT="f0/0" # f0/1 g0/1 Se0/0/0
NUMBER="10" # 20 30 40
```

2. ## BASIC
1. ### basic operations
enable:
```bash
enable
```

config:
```bash
configuration terminal
```

interface:
```bash
interface ${PORT}
```

3. ## VLAN
1. ### show vlan
```bash
show vlan brief
```

2. ### create new vlan
```bash
vlan
vlan ${NUMBER}
name VLANNAME
exit
```

3. ### show trunk mode
on `master` switch:
```bash
show interface trunk
```

4. ### create trunk mode
on `master` switch:
```bash
interface ${PORT}
switchport mode trunk
```
