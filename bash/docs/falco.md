# FALCO

## 1. Installation
### 1. Docker
#### 1. Default rule
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

#### 2. Custom rule
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

### 2. Kubernetes
#### 1. Helm
Add helm repository:
```
helm repo add falcosecurity https://falcosecurity.github.io/charts
helm repo update
```

Install helm repository:
```
helm install --replace falco --namespace falco --create-namespace --set tty=true falcosecurity/falco
```

Check pod status:
```
kubectl get pods -n falco
```

```
kubectl wait pods --for=condition=Ready --all -n falco
```

Create an nginx deployment for testing:
```
kubectl create deployment nginx --image=nginx
```

Test:
```
kubectl exec -it $(kubectl get pods --selector=app=nginx -o name) -- cat /etc/shadow
```

Collect warning log:
```
kubectl logs -l app.kubernetes.io/name=falco -n falco -c falco | grep Warning
```

#### 2. Custom rule
Custom rule [values.yaml]:
```
customRules:
  custom-rules.yaml: |-
    - rule: Write below etc
      desc: An attempt to write to /etc directory
      condition: >
        (evt.type in (open,openat,openat2) and evt.is_open_write=true and fd.typechar='f' and fd.num>=0)
        and fd.name startswith /etc
      output: "File below /etc opened for writing (file=%fd.name pcmdline=%proc.pcmdline gparent=%proc.aname[2] ggparent=%proc.aname[3] gggparent=%proc.aname[4] evt_type=%evt.type user=%user.name user_uid=%user.uid user_loginuid=%user.loginuid process=%proc.name proc_exepath=%proc.exepath parent=%proc.pname command=%proc.cmdline terminal=%proc.tty %container.info)"
      priority: WARNING
      tags: [filesystem, mitre_persistence]    
```

upgrade with new helm value file [values.yaml]:
```
helm upgrade --namespace falco falco falcosecurity/falco --set tty=true -f values.yaml
```

Check pod status:
```
kubectl wait pods --for=condition=Ready --all -n falco
```

Testing:
```
kubectl exec -it $(kubectl get pods --selector=app=nginx -o name) -- touch /etc/test_file_for_falco_rule
```

Check warning logs:
```
kubectl logs -l app.kubernetes.io/name=falco -n falco -c falco | grep Warning
```

#### 3. Enable UI [ Expose ]
Helm file [values.yaml]:
```
falcosidekick:
  enabled: true
falcosidekick:
  webui:
    enabled: true

customRules:
  custom-rules.yaml: |-
    - rule: Write below etc
      desc: An attempt to write to /etc directory
      condition: >
        (evt.type in (open,openat,openat2) and evt.is_open_write=true and fd.typechar='f' and fd.num>=0)
        and fd.name startswith /etc
      output: "File below /etc opened for writing (file=%fd.name pcmdline=%proc.pcmdline gparent=%proc.aname[2] ggparent=%proc.aname[3] gggparent=%proc.aname[4] evt_type=%evt.type user=%user.name user_uid=%user.uid user_loginuid=%user.loginuid process=%proc.name proc_exepath=%proc.exepath parent=%proc.pname command=%proc.cmdline terminal=%proc.tty %container.info)"
      priority: WARNING
      tags: [filesystem, mitre_persistence]    
```

helm upgrade:
```
helm upgrade --namespace falco falco falcosecurity/falco -f values.yaml
```

```
kubectl exec -it $(kubectl get pods --selector=app=nginx -o name) -- cat /etc/shadow
```

Expose to localhost:
```
kubectl -n falco port-forward svc/falco-falcosidekick-ui 2802
```

Test open browser on localhost:2802
```
kubectl exec -it $(kubectl get pods --selector=app=nginx -o name) -- cat /etc/shadow
```

#### 4. Slack webhook [ Alert notification ]
Helm file [values.yaml]:
```
falcosidekick:
  enabled: true
falcosidekick:
  webui:
    enabled: true
  config:
    slack:
      webhook: <SLACK_WEBHOOK_URL>
      minimumpriority: notice

customRules:
  custom-rules.yaml: |-
    - rule: Write below etc
      desc: An attempt to write to /etc directory
      condition: >
        (evt.type in (open,openat,openat2) and evt.is_open_write=true and fd.typechar='f' and fd.num>=0)
        and fd.name startswith /etc
      output: "File below /etc opened for writing (file=%fd.name pcmdline=%proc.pcmdline gparent=%proc.aname[2] ggparent=%proc.aname[3] gggparent=%proc.aname[4] evt_type=%evt.type user=%user.name user_uid=%user.uid user_loginuid=%user.loginuid process=%proc.name proc_exepath=%proc.exepath parent=%proc.pname command=%proc.cmdline terminal=%proc.tty %container.info)"
      priority: WARNING
      tags: [filesystem, mitre_persistence]    
```
