# DOCKER DEEP DIVE

## 1. Architecture
### 1.  Docker client: CLI use to interact with `Docker daemon`
### 2.  Docker daemon: A rich version, HTTP API translate CLI interaction to `CRUD API`
### 3.  Containerd: A `bridge` between `Docker daemon` and `runc`
### 4.  runc: use to create container [ container runtime ]

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
| Hard to scale [ cost, boot time ] | **Game changer** if our system have `thousand of containers` [ Scalability ] |

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

### 2. Build
`--no-cache`: Dont cache build
`--push`: Push after build
`--use`: Use cloud builder after create
`--bootstrap`: Use cloud builder after bootstrap
`docker buildx ls`: List builder
`docker buildx create --driver cloud ORG/BUILDER_NAME`: Create cloud builder
`docker buildx build --builder cloud-ORG-BUILDER_NAM`: Build specify cloud builder
`docker buildx imagetools inspect <username>/<image>:latest`: inspect image using `imagetools`

#### 1. Multi stage build
It is just a `Dockerfile` with **multiple** `FROM` that can easily `COPY` artifacts from *previous Stage*
```
FROM ubuntu:latest AS first-stage
...


FROM centos:latest AS second-stage
COPY --from=first-stage /PATH/TO/LOCATION .
...


```
Note: `second-stage` build `final stage` and include **necessary part** from `previous stage`

```
# syntax=docker/dockerfile:1
FROM golang:1.21-alpine AS base
WORKDIR /src
COPY go.mod go.sum .
RUN go mod download
COPY . .

FROM base AS build-client
RUN go build -o /bin/client ./cmd/client

FROM base AS build-server
RUN go build -o /bin/server ./cmd/server

FROM scratch
COPY --from=build-client /bin/client /bin/
COPY --from=build-server /bin/server /bin/
ENTRYPOINT [ "/bin/server" ]
```
```
docker build --tag=buildme .
```

Example:
```
# syntax=docker/dockerfile:1
FROM golang:1.21-alpine AS base
WORKDIR /src
COPY go.mod go.sum .
RUN go mod download
COPY . .

FROM base AS build-client
RUN go build -o /bin/client ./cmd/client

FROM base AS build-server
RUN go build -o /bin/server ./cmd/server

FROM scratch AS client
COPY --from=build-client /bin/client /bin/
ENTRYPOINT [ "/bin/client" ]

FROM scratch AS server
COPY --from=build-server /bin/server /bin/
ENTRYPOINT [ "/bin/server" ]
```

Specify target:
```
docker build --tag=buildme-client --target=client .
```
```
docker build --tag=buildme-server --target=server .
```

Use an external image as a stage [ Copy things that `available` from an `standard image` ]:
```
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
```

Differences between legacy builder and BuildKit:

* `Legacy builder` will build a stage when specify `--target` even if the selected target `doesn't depend` on that stage.
* `BuildKit` only builds the stages that the `target stage depends on`.

Example Dockerfile:
```
# syntax=docker/dockerfile:1
FROM ubuntu AS base
RUN echo "base"

FROM base AS stage1
RUN echo "stage1"

FROM base AS stage2
RUN echo "stage2"
```
```
DOCKER_BUILDKIT=1 docker build --no-cache -f Dockerfile --target stage2 .
```

#### 2. Mount
##### 1. Cache
```
RUN --mount=type=cache,target=/go/pkg/mod/ \
    go mod download -x
```
This will cache your `downloaded package` depends on your `package manager`

##### 2. Bind
```
    --mount=type=bind,source=go.sum,target=go.sum \
    --mount=type=bind,source=go.mod,target=go.mod \
```
With this you don't need to `COPY go.mod go.sum .` any more as it already `bind to host`

```
--mount=type=bind,target=. \
```
With this you don't need to `COPY . .` any more as it already `bind to host`


#### 3. Build arguments
##### 1. Pass arguments to Dockerfile
```
ARG GO_VERSION=1.21
FROM golang:${GO_VERSION}-alpine AS base
```
```
docker build --build-arg="GO_VERSION=1.19" .
```
##### 2. Pass arguments to build command in container
```
ARG APP_VERSION="v0.0.0+unknown"
RUN --mount=type=cache,target=/go/pkg/mod/ \
    --mount=type=bind,target=. \
    go build -o /bin/server ./cmd/server
    go build -ldflags "-X main.version=$APP_VERSION" -o /bin/server ./cmd/server
```
```
docker build --target=server --build-arg="APP_VERSION=v0.0.1" --tag=buildme-server .
```

#### 4. Export binaries
Copy binaries from `previous stage` to `binary stage from scratch`
```
FROM scratch AS binaries
COPY --from=build-client /bin/client /
COPY --from=build-server /bin/server /
```

Build `command` with `output to host`:
```
docker build --output=bin --target=binaries .
```

List binaries in host:
```
ls -l ./bin
total 29392
-rwxr-xr-x  1 user  user  7581933 Apr  6 09:33 client
-rwxr-xr-x  1 user  user  7459368 Apr  6 09:33 server
```

#### 5. Test
```
ARG GOLANGCI_LINT_VERSION=v1.52
FROM golangci/golangci-lint:${GOLANGCI_LINT_VERSION} as lint
WORKDIR /test
RUN --mount=type=bind,target=. \
    golangci-lint run
```
Build `command` specify `target` to `lint`:
```
docker build --target=lint .
```

#### 6. Multi platform
##### 1. Emulation [ may take a longer time ]
Build `command` with `single platform`:
```
docker build --target=server --platform=linux/amd64
```
Build `command` with `multi platform`:
```
docker build --target=server --platform=linux/amd64,linux/arm64
```
##### 2. Cross compiles [ faster, because it does not need to rebuild same steps ]
```
FROM --platform=$BUILDPLATFORM golang:${GO_VERSION}-alpine AS base
...

FROM base AS build-client
ARG TARGETOS
ARG TARGETARCH
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=bind,target=. \
    go build -o /bin/client ./cmd/client
    GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /bin/client ./cmd/client
```
```
docker build \
  --target=binaries \
  --output=bin \
  --platform=darwin/arm64,windows/amd64,linux/amd64 .
```
#### 7. Build context
```
docker build [OPTIONS] PATH | URL | -
```
* [ Local file ] The `relative` or `absolute path` to a `local directory`
* [ Git repositories ] A `remote URL` of a `Git repository`, `tarball`, or `plain-text file`
* [ Remote tarball ] A `plain-text file` or `tarball piped` to the docker build command through `standard input`
##### 1. Stdin
```
docker build -f- <PATH>
```
```
# create a directory to work in
mkdir example
cd example

# create an example file
touch somefile.txt

# build an image using the current directory as context
# and a Dockerfile passed through stdin
docker build -t myimage:latest -f- . <<EOF
FROM busybox
COPY somefile.txt ./
RUN cat /somefile.txt
EOF
```
##### 2. Tarball
```
tar czf foo.tar.gz *
docker build - < foo.tar.gz
```

##### 3. Remote context
###### 1. Git repositories
```
docker build https://github.com/user/myrepo.git
```

URL fragments `#ref:dir`, where:
* `ref` is the name of the `branch`, `tag`, or `remote reference`
* `dir` is a `subdirectory` inside the repository
```
docker build https://github.com/user/myrepo.git#container:docker
```

The following table represents all the valid suffixes with their build contexts:
| myrepo.git | refs/heads/<default | branch> | / |
| myrepo.git#mytag | refs/tags/mytag | /
| myrepo.git#mybranch	| refs/heads/mybranch | / |
| myrepo.git#pull/42/head | refs/pull/42/head | / |
| myrepo.git#:myfolder | refs/heads/<default | branch> | /myfolder |
| myrepo.git#master:myfolder | refs/heads/master | /myfolder |
| myrepo.git#mytag:myfolder | refs/tags/mytag | /myfolder |
| myrepo.git#mybranch:myfolder | refs/heads/mybranch | /myfolder |

Private repositories
```
docker buildx build --ssh default git@github.com:user/private.git
```

token-based authentication instead
```
GIT_AUTH_TOKEN=<token> docker buildx build \
  --secret id=GIT_AUTH_TOKEN \
  https://github.com/user/private.git
```

Remote context with Dockerfile from `stdin` [ `without Dockerfile` or `without using default Dockerfile` ]
```
docker build -f- URL
```
Eg:
```
docker build -t myimage:latest -f- https://github.com/docker-library/hello-world.git <<EOF
FROM busybox
COPY hello.c ./
EOF
```

###### 2. Remote tarball
```
docker build http://server/context.tar.gz
```
Other file extension: [ `xz, bzip2, gzip or identity (no compression)` ]

###### 3. Empty context
You can build with an empty build context when your Dockerfile `doesn't depend` on any `local files`

Unix pipe:
```
docker build - < Dockerfile
```

Powershell:
```
Get-Content Dockerfile | docker build -
```

Heredocs:
```
docker build -t myimage:latest - <<EOF
FROM busybox
RUN echo "hello world"
EOF
```

Remote file:
```
docker build https://raw.githubusercontent.com/dvdksn/clockbox/main/Dockerfile
```

Note: When you build `without a filesystem context`, Dockerfile instructions such as `COPY can't refer to local files`:

###### 4. .dockerignore
You can use a `.dockerignore` file to `exclude files or directories` from the `build context`.

Template:
```
# comment
*/temp*
*/*/temp*
temp?
```

Eg:
```
*.md
!README*.md
README-secret.md
```


### 3. Other instructions include
#### 1. ADD
#### 2. ARG
* They're not accessible or present in containers instantiated from the image unless explicitly passed through from the Dockerfile into the image filesystem or configuration. They may persist in the image metadata
* Eg: `ARG NODE_VERSION="20"`
ENV
* Environment variables are passed through to the build execution environment, and persist in containers instantiated from the image.
* Eg: `ENV FLASK_APP=hello`
* Build command: `docker build --build-arg NODE_VERSION=current .`

Global Scope: 
```
# syntax=docker/dockerfile:1

# The following build argument is declared in the global scope:
ARG NAME="joe"

FROM alpine
# The following instruction doesn't have access to the $NAME build argument
# because the argument was defined in the global scope, not for this stage.
RUN echo "hello ${NAME}!"
```

because the value of the NAME build argument is out of scope. To inherit global build arguments into a stage, you must consume them:
```
# syntax=docker/dockerfile:1

# Declare the build argument in the global scope
ARG NAME="joe"

FROM alpine
# Consume the build argument in the build stage
ARG NAME
RUN echo $NAME
```

Pass `ARG` to `ENV`:
```
ARG NODE_ENV=production
ENV NODE_ENV=$NODE_ENV
```

Multi-platform build arguments:
* BUILDPLATFORM
* BUILDOS
* BUILDARCH
* BUILDVARIANT

* TARGETPLATFORM
* TARGETOS
* TARGETARCH
* TARGETVARIANT

| Variable | Type | Description |
| BUILDKIT_COLORS | String | Configure text color for the terminal output |
| BUILDKIT_HOST |  | String  Specify host to use for remote builders |
| BUILDKIT_PROGRESS |  | String  Configure type of progress output |
| BUILDKIT_TTY_LOG_LINES |  |String  Number of log lines (for active steps in tty mode) |
| BUILDX_BUILDER |  |String  Specify the builder instance to use |
| BUILDX_CONFIG |  | String  Specify location for configuration, state, and logs |
| BUILDX_EXPERIMENTAL | Boolean |Turn on experimental features |
| BUILDX_GIT_CHECK_DIRTY |  |Boolean Enable dirty Git checkout detection |
| BUILDX_GIT_INFO | Boolean |Remove Git information in provenance attestations |
| BUILDX_GIT_LABELS |  | String | Boolean    Add Git provenance labels to images |
| BUILDX_NO_DEFAULT_ATTESTATIONS |  |Boolean Turn off default provenance attestations |
| BUILDX_NO_DEFAULT_LOAD |  |Boolean Turn off loading images to image store by default |
| EXPERIMENTAL_BUILDKIT_SOURCE_POLICY | String | Specify a BuildKit source policy file |


#### 3. LABEL
#### 4. ENV
#### 5. ONBUILD
#### 6. HEALTHCHECK


### 4. Secret
* A build secret is any `piece of sensitive information`, such as a `password` or `API token`, consumed as part of your application's build process.
#### 1. Secret mount
Eg:
```
RUN --mount=type=secret,id=mytoken \
    TOKEN=$(cat /run/secrets/mytoken) ...
```

##### 1. CLI
```
docker build --secret id=mytoken,src=$HOME/.aws/credentials .
```

##### 2. Bake
```
```

#### 2. SSH mount
```
```

## 8. Docker Swarm
Swarm mode uses TLS to encryption, authentication nodes , authorize roles. It has machanism of automatic key rotation

Manager nodes: Although you have `many manager nodes`, but `one` of them is considered `active`. This call `manager node`

Swarm uses `Raft consensus algorithm`
* Best practices
  * Deploy an odd number of managers ( to against split brain )
  * Dont deploy to many manager nodes ( Just 3 or 5 ) ( More nodes mean more time to consensus )

## 9. Service
Is a set of `containers` with same `config, image,...`

Docker swarm run a reconcilation loop that constantly compares actual state and disire state. If they are not match, the swarm take action so that they do 

Eg: If you run a service with `5 replicas`, by an unknown reason your replicas is `4`, after monitor and compare it will create a `new replica`

Every node gets a mapping that can redirect your request to a node that runs a service

## 10. Overlay network [ Over layer network ]
Eg: network that connect multiple subnet CIDR together

Command to create overlay network:
```
docker network create -d overlay NETWORK_NAME
```
* The `control plane` is encrypt with TLS by default
* If your want to encrypt the `data plane` just add `-o` add the end of command.
* Overlay network just made `available to nodes`, which `run containers` that `attached to overlay`
* Note: Overlay network CIDR does not need to match physical CIDR, and each container has their own IP address from the network CIDR.

## 11. How overlay network works
* Overlay network leverages VXLAN tunnel to create virtual Layer 2 overlay network
* It create a network namespace on each host [ a network namespace is like a container but instead of running application, it runs an isolated network stack

* Architecture
  * A virtual switch ( virtual bridge ) is created in network namespace
  * `A VXLAN Tunnel End Point` is created with one end plumbed into `virtual switch` and another plumbed into `host network stack`
  * The end of the `network stack` get an `IP address` that is bound to `a UDP socket` on port `4789`
  * Each container get it's own `Virtual Ethernet` ( veth ) adapter that `plumbed into virtual bridge`

## 12. Security in Docker
`Container` actually is a `collection of well organized of namespace` [ pid, net, mnt, uts,... ]

Docker on Linux technology relies on `Linux security technology`:
 * kernal namespace
   * Process ID [ PID ]: Provide `isolated process tree for each container`. So every container have its own PID 1, and `cannot access` to other `container's process` tree or `host's process` tree
   * Network [ net ]: Provide `isolated network stack` include [ interfaces, ip adressess and routing table ]. Eg: every container get `its own eth0`, `an unique IP address` and `a range of ports`
   * Filesystem mount [ mnt ] Provide `isolated / root filesystem` mean it can has its own `/etc`, `/var`, `/dev`. It `cannot` access `other's filesystem` or `host's filesystem`
   * Inter process communication [ ipc ]: Allow `shared memory` between process `inside a container`. It `cannot` access `host's share memory` or `other container's share memory`
   * User [ user ]: Allow to map `host' user` to `container's user`. Eg: Map a `non root host's user` to `container's root user`
   * Unix Time Sharing [ uts ]: Provide a container with `its own hostnamae`
 * control groups: Allow you to `set limits` on `CPU`, `RAM`, `disk I/O`,... of `Linux host` for `container`
 * capability
   * Ability to boot
   * Ability to boot
 * mandatory access control ( MAC ) system
 * seccomp

## 12. My way
Find current linux namespace:
```
ls -l /proc/$$/ns
```
```
ls -l /proc/$$/ns | awk '{print $1, $9, $10, $11}'
```
```
readlink /proc/$$/ns/cgroup
readlink /proc/$$/ns/pid
readlink /proc/$$/ns/mnt
readlink /proc/$$/ns/uts
```

## 13. Docker Daemon
### 1. Start daemon
#### 1. With systemd:
```
sudo systemctl start docker
```
#### 2. With dockerd:
```
dockerd

INFO[0000] +job init_networkdriver()
INFO[0000] +job serveapi(unix:///var/run/docker.sock)
INFO[0000] Listening for HTTP on unix (/var/run/docker.sock)
```
To stop just:
```
Ctrl+C
```

### 2. Configuration file

Linux [ regular ]: `/etc/docker/daemon.json`
Linux [ rootless ]: `$HOME/.config/docker/daemon.json`
Window: `C:\ProgramData\docker\config\daemon.json`

You can use `dockerd --config-file PATH/TO/CONFIGFILE` to specify different location

You can set configuration by `command` or `config file`

### 3. Daemon data directory
```
```

### 4. Live restore

`By default`, when docker daemon `terminates`. its `shutdown` running containers. But you `can configure` docker daemon that containers will `remain running` if daemon become unavailable
Configuration file:
```
{
  "live-restore": true
}
```
Command:
```
dockerd --live-restore
```

### 5. Remote access

Configuration file:
```
{
  "hosts": ["unix:///var/run/docker.sock", "tcp://127.0.0.1:2375"]
}
```

Service file:
```
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375
```
