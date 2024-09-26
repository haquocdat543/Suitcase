# IPTABLES

## 1. Types
Specified by the argument to the option -t (defaulting to filter)

* filter
* nat
* raw
* mangle
* security

## 2. Command
List rules in all chain:
```
iptables -L
```

List with line number in `INPUT` chain:
```
iptables -L --line-number
```

Add rule in `INPUT` chain:
```
IPtables -A INPUT -p tcp --dport 22 -j ACCEPT
```

Add rule with priority in `INPUT` chain:
```
IPtables -A INPUT 2 -p tcp --dport 22 -j ACCEPT
```

Delete rule with priority in `INPUT` chain:
```
IPtables -D INPUT 2
```

Delete rule with drop action in `INPUT` chain:
```
IPtables -D INPUT -j DROP
```
