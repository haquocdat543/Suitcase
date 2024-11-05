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

## 3. Usage
### 1. Reverse proxy
# Allow incoming traffic on port 5432 (or your database port)
```
sudo iptables -A INPUT -p tcp -m tcp --dport 5432 -j ACCEPT
```

# Forward traffic from the public IP to the private IP
```
sudo iptables -t nat -A PREROUTING -d PUBLIC_IP -p tcp --dport 5432 -j DNAT --to-destination 10.0.1.10:5432
```

# Allow forwarded packets
```
sudo iptables -A FORWARD -p tcp -d 10.0.1.10 --dport 5432 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
```
