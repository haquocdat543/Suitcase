# DOCKER DEEP DIVE

## 1. Architecture
* Docker client: CLI use to interact with `Docker daemon`
* Docker daemon: A rich version, HTTP API translate CLI interaction to `CRUD API`
* Containerd: A `bridge` between `Docker daemon` and `runc`
* runc: use to create container [ container runtime ]

## 2. Image
- Usually small
- Just has necessary part of OS [ That's why it is does not have `sudo, wget,...` by dafault ]

## 3. Layer
#### 1. Inspect

When pull image:
```
docker pull centos:latest
```

Inspect image to retrieve `layer data` and `metadata`, `cmd`:
```
docker image inspect centos:latest
```

* `MAINTAINER`,`ENV`,`EXPOSE`,`ENTRYPOINT` does not create new `layer data`, just add `metadata`

#### 2. Sharing image layers

We will add `-a` option to pull `all version` of an image:
```
docker pull -a centos:latest
```

And because images sharing layers so we will see `Already Exist` when pull images, so just need to pull `different layers`.

## 4. Digest [ image hash ]
Get images's digests:
```
docker image ls --digest
```

Pull image with image's digest:

```
docker pull centos@DIGEST
```
This will pull exactly image that you specify, avoid of pull same tag image.

## 5. Comparison between Virtualization and Containerization
| Virtualization | Containerization |
|-----------------------------------------|:--------------------------------------------|
| `Each Kernel` for `each VM` [ Consume more CPU, RAM,... ] | `Single Kernal` for `all container` ( **Kernal sharing** ) [ Just only host's Kernal consume CPU and RAM ]  |
| Slower to boot ( Cuz of fully OS ) | Faster to boot ( Cuz of necessary part of OS ) |
| `OS Tax` for `each VM` | `OS Tax` for just `host OS` |
| Hard to scale [ cost, boot time ] | *Game changer* if our system have `thousand of containers` [ Scalability ] |

## 6. Container

* Docker daemon implement Docker Remote API at `/var/run/docker.sock` on `Linux`
* Docker daemon implement Docker Remote API at `npipe:////./pipe/docker_engine` on `Window`
  * Default non TLS port is `2375`
  * Default TLS port is `2376`

### 1. Data persistent
* Your data is `persistent` after `stop` and `start` container.

### 2. Stop container gracefully, Linux POSIX
Stop then delete container [ gracefully way, recommend ]:
```
docker container stop HASH/CONTAINER_NAME
docker container rm HASH/CONTAINER_NAME
```
* `Stop` command will send POSIX signal to `SIGTERM`, give container `more time` to clean things u
* `Delete` command will send POSIX signal to `SIGKILL` that `kill` it

Delete container [ Violate way, not recommend ]:
```
docker container rm HASH/CONTAINER_NAME -f
```
* `Delete` command will send POSIX signal `directly` to `SIGKILL` that `kill` it `immediately`

## 7. Containerization
Main goal: keep image small

### 1. Inspect history
Inspect commands ran in an built image:
```
docker image history IMAGE
```
Inspect `data` include `cmd` in image:
```
docker image inspect IMAGE
```

### 2. Multi stage build
It is just a `Dockerfile` with **multiple** `FROM` that can easily `COPY` artifacts from *previous Stage*
```
FROM ubuntu:latest AS first-stage
...


FROM centos:latest AS second-stage
COPY --from=first-stage /PATH/TO/LOCATION .
...


```
Note: `second-stage` build `final stage` and include **necessary part** from `previous stage`

### 3. Other instructions include
* LABEL
* ENV
* ONBUILD
* HEALTHCHECK

## 8. Docker Swarm
Swarm mode uses TLS to encryption, authentication nodes , authorize roles. It has machanism of automatic key rotation

Manager nodes: Although you have *many manager nodes*, but *one* of them is considered *active*. This call *manager node*

Swarm uses *Raft consensus algorithm*
* Best practices
  * Deploy an odd number of managers ( to against split brain )
  * Dont deploy to many manager nodes ( Just 3 or 5 ) ( More nodes mean more time to consensus )

## 9. Service
Is a set of *containers* with same *config, image,...*

Docker swarm run a reconcilation loop that constantly compares actual state and disire state. If they are not match, the swarm take action so that they do 

Eg: If you run a service with *5 replicas*, by an unknown reason your replicas is *4*, after monitor and compare it will create a *new replica*

Every node gets a mapping that can redirect your request to a node that runs a service

## 10. Overlay network [ Over layer network ]
Eg: network that connect multiple subnet CIDR together

Command to create overlay network:
```
docker network create -d overlay NETWORK_NAME
```
* The *control plane* is encrypt with TLS by default
* If your want to encrypt the *data plane* just add *-o* add the end of command.
* Overlay network just made *available to nodes*, which *run containers* that *attached to overlay*
* Note: Overlay network CIDR does not need to match physical CIDR, and each container has their own IP address from the network CIDR.

## 11. How overlay network works
* Overlay network leverages VXLAN tunnel to create virtual Layer 2 overlay network
* It create a network namespace on each host [ a network namespace is like a container but instead of running application, it runs an isolated network stack

* Architecture
  * A virtual switch ( virtual bridge ) is created in network namespace
  * *A VXLAN Tunnel End Point* is created with one end plumbed into *virtual switch* and another plumbed into *host network stack*
  * The end of the *network stack* get an *IP address* that is bound to *a UDP socket* on port *4789*
  * Each container get it's own *Virtual Ethernet* ( veth ) adapter that *plumbed into virtual bridge*

## 12. Security in Docker
*Container* actually is a *collection of well organized of namespace* [ pid, net, mnt, uts,... ]

Docker on Linux technology relies on *Linux security technology*:
 * kernal namespace
   * Process ID [ PID ]: Provide *isolated process tree for each container*. So every container have its own PID 1, and *cannot access* to other *container's process* tree or *host's process* tree
   * Network [ net ]: Provide *isolated network stack* include [ interfaces, ip adressess and routing table ]. Eg: every container get *its own eth0*, *an unique IP address* and *a range of ports*
   * Filesystem mount [ mnt ] Provide *isolated / root filesystem* mean it can has its own */etc*, */var*, */dev*. It *cannot* access *other's filesystem* or *host's filesystem*
   * Inter process communication [ ipc ]: Allow *shared memory* between process *inside a container*. It *cannot* access *host's share memory* or *other container's share memory*
   * User [ user ]: Allow to map *host' user* to *container's user*. Eg: Map a *non root host's user* to *container's root user*
   * Unix Time Sharing [ uts ]: Provide a container with *its own hostnamae*
 * control groups: Allow you to *set limits* on *CPU*, *RAM*, *disk I/O*,... of *Linux host* for *container*
 * capability
 * mandatory access control ( MAC ) system
 * seccomp
