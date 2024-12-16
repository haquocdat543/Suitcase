# NETDATA

## 1. Installation
Installation script:
```bash
wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh --no-updates
```

Daemon process:
```bash
sudo systemctl start netdata
sudo systemctl enable netdata
```

Configuration path:
```bash
sudo nano /etc/netdata/netdata.conf
```
