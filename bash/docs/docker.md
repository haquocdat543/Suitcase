# Docker

## Backup Docker Swarm
#### 1. Backing up
##### 1. Stop Docker on all manager nodes
##### 2. Back up the entire /var/lib/docker/swarm directory
##### 3. Start Docker again on all manager nodes
#### 2. Restore
##### 1. Remove /var/lib/docker/swarm on new Docker swarm
##### 2. Restore the /var/lib/docker/swarm directory with the contents of the backup
##### 3. Start Docker again
##### 4. Iniialize swarm again
##### 5. Add managers and workers again
