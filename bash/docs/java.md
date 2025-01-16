# JAVA

## Limit
### CPU & Memory
```bash
java -Xms512m -Xmx2g -XX:MaxMetaspaceSize=256m -Xss512k -jar YourApp.jar
```
```yaml
Initial heap size: 512 MB (-Xms512m)
Maximum heap size: 2 GB (-Xmx2g)
Maximum Metaspace size: 256 MB (-XX:MaxMetaspaceSize=256m)
Stack size: 512 KB per thread (-Xss512k)
```
