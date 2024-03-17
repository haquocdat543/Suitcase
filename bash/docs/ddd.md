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
#### 1. Inspact

When pull image:
```
docker pull centos:latest
```

Inspect image to retrieve `layer data` and `metadata`:
```
docker image inspect centos:latest
```

* `MAINTAINER`,`ENV`,`EXPOSE`,`ENTRYPOINT` does not create new layer

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

## 5. Comparison between Virtualization and Containerization
| Virtualization | Containerization |
|-----------------------------------------|:--------------------------------------------|
| `Each Kernel` for `each VM` [ Consume more CPU, RAM,... ] | `Single Kernal` for `all container` ( **Kernal sharing** ) [ Just only host's Kernal consume CPU and RAM ]  |
| Slower to boot ( Cuz of fully OS ) | Faster to boot ( Cuz of necessary part of OS ) |
| `OS Tax` for `each VM` | `OS Tax` for just `host OS` |
