# FIREWALL

## UFW
### 1. Command
List with number:
```
ufw status numbered
```

Delete by number:
```
ufw delete <number>
```

Add rule:
```
ufw status <action> from <source> proto <protocol> to <destination> port <port>
```
* action: [ allow / deny ]
* source: [ any, 1.0.1.0, ... ]
* protocol: [ tcp, udp, ... ]
* destination: [ any, 1.0.1.0, ... ]
* port: [ 80, 443, ... ]

