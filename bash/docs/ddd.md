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
Note: `second-stage` build `final build stage` and include **necessary part** from `previous stage`

### 3. Other instructions include
* LABEL
* ENV
* ONBUILD
* HEALTHCHECK
