# NETDATA

## 1. Installation
Installation script:
```
wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh --no-updates
```

Daemon process:
```
sudo systemctl start netdata
sudo systemctl enable netdata
```

Configuration path:
```
sudo nano /etc/netdata/netdata.conf
```
