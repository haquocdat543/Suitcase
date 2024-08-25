# FALCO

## 1. Installation
### 1. Docker
```
sudo docker run --rm -i -t --name  --privileged  \
    -v /var/run/docker.sock:/host/var/run/docker.sock \
    -v /dev:/host/dev -v /proc:/host/proc:ro -v /boot:/host/boot:ro \
    -v /lib/modules:/host/lib/modules:ro -v /usr:/host/usr:ro -v /etc:/host/etc:ro \
    security/:0.38.2
```

trigger a rule:
```
sudo cat /etc/shadow
```

custom rule:
```
- rule: Write below etc
  desc: An attempt to write to /etc directory
  condition: >
    (evt.type in (open,openat,openat2) and evt.is_open_write=true and fd.typechar='f' and fd.num>=0)
    and fd.name startswith /etc    
  output: "File below /etc opened for writing (file=%fd.name pcmdline=%proc.pcmdline gparent=%proc.aname[2] ggparent=%proc.aname[3] gggparent=%proc.aname[4] evt_type=%evt.type user=%user.name user_uid=%user.uid user_loginuid=%user.loginuid process=%proc.name proc_exepath=%proc.exepath parent=%proc.pname command=%proc.cmdline terminal=%proc.tty %container.info)"
  priority: WARNING
  tags: [filesystem, mitre_persistence]
```

Run docker container with new rule:
```
sudo docker run --name  --rm -i -t --privileged \
    -v $(pwd)/_custom_rules.yaml:/etc//_rules.local.yaml \
    -v /var/run/docker.sock:/host/var/run/docker.sock \
    -v /dev:/host/dev -v /proc:/host/proc:ro -v /boot:/host/boot:ro \
    -v /lib/modules:/host/lib/modules:ro -v /usr:/host/usr:ro -v /etc:/host/etc:ro \
    security/:0.38.2
```

Test:
```
sudo touch /etc/test_file_falco_rule
```

