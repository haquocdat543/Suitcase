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

|  | | |
|------------|:---------------------------|:--------|
| myrepo.git | refs/heads/<defaultbranch> | / |
| myrepo.git#mytag | refs/tags/mytag | / |
| myrepo.git#mybranch | refs/heads/mybranch | / |
| myrepo.git#pull/42/head | refs/pull/42/head | / |
| myrepo.git#:myfolder | refs/heads/<defaultbranch> | /myfolder |
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
* Usually download from remote source:
```
ADD https://github.com/moby/buildkit.git#v0.10.1 /buildkit
```
keep `.git` folder:
```
ADD --keep-git-dir=true https://github.com/moby/buildkit.git#v0.10.1 /buildkit
```

Check sum:
```
DD --checksum=sha256:24454f830cdb571e2c4ad15481119c43b3cafd48dd869a9b2945d1036d1dc68d https://mirrors.edge.kernel.org/pub/linux/kernel/Historic/linux-0.01.tar.gz /
```

Other options:
* `ADD --chown --chmod`
* `ADD --link`
* `ADD --exclude`

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
|----------|:-----|:------------|
| BUILDKIT_COLORS | String | Configure text color for the terminal output |
| BUILDKIT_HOST | String  Specify host to use for remote builders |
| BUILDKIT_PROGRESS | String  Configure type of progress output |
| BUILDKIT_TTY_LOG_LINES | String  Number of log lines (for active steps in tty mode) |
| BUILDX_BUILDER | String  Specify the builder instance to use |
| BUILDX_CONFIG | String  Specify location for configuration, state, and logs |
| BUILDX_EXPERIMENTAL | Boolean |Turn on experimental features |
| BUILDX_GIT_CHECK_DIRTY | Boolean Enable dirty Git checkout detection |
| BUILDX_GIT_INFO | Boolean | Remove Git information in provenance attestations |
| BUILDX_GIT_LABELS | String | Boolean    Add Git provenance labels to images |
| BUILDX_NO_DEFAULT_ATTESTATIONS | Boolean Turn off default provenance attestations |
| BUILDX_NO_DEFAULT_LOAD | Boolean Turn off loading images to image store by default |
| EXPERIMENTAL_BUILDKIT_SOURCE_POLICY | String | Specify a BuildKit source policy file |


#### 3. LABEL
Template:
```
LABEL <key>=<value> <key>=<value> <key>=<value> ...
```

Example:
```
LABEL "com.example.vendor"="ACME Incorporated"
LABEL com.example.label-with-value="foo"
LABEL version="1.0"
LABEL description="This text illustrates \
that label-values can span multiple lines."
```

#### 4. ONBUILD
* Use to `define action` that will be taken if there is `other stage` is build from `current stage`
* Those `ONBUILD action` will not be execute in `current stage`. It only execute in `child stage`

Template:
```
ONBUILD <INSTRUCTION>
```

Eg:
```
ONBUILD ADD . /app/src
ONBUILD RUN /usr/local/bin/python-build --dir /app/src
```

Notes: 
* ONBUILD ONBUILD isn't allowed
* The ONBUILD instruction may not trigger FROM or MAINTAINER instructions

#### 5. HEALTHCHECK
CMD type:
```
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
```

NONE type [ Usually use when `turn off Healthcheck` from `parent stage` ]:
```
HEALTHCHECK NONE
```

Status:
* 0: `success` - the container is healthy and ready for use
* 1: `unhealthy` - the container isn't working correctly
* 2: `reserved` - don't use this exit code

#### 6. VOLUME
The docker run command initializes the newly created volume with any data that exists at the specified location within the base image.
```
VOLUME ["/data"]
```

#### 7. USER
```
USER <user>[:<group>]
```
Eg:
```
USER <UID>[:<GID>]
```

#### 8. STOPSIGNAL
Define `action` when execute `docker stop`:

Template
```
STOPSIGNAL signal
```

Example:
```
STOPSIGNAL KILL
```

Note: `SIGTERM` if not define

#### 9. SHELL
* The SHELL instruction allows the `default shell` used for the `shell form` of commands to be `overridden`. The default shell on `Linux is ["/bin/sh", "-c"]`, and on `Windows is ["cmd", "/S", "/C"]`
* The SHELL instruction is particularly useful on Windows where there are two commonly used and quite different native shells: cmd and powershell, as well as alternate shells available including sh
* The SHELL instruction can `appear multiple times`. Each SHELL instruction `overrides all previous SHELL instructions`, and `affects all subsequent instructions`

Template
```
SHELL ["executable", "parameters"]
```

Example
```
SHELL ["powershell", "-command"]
RUN Write-Host hello
```

#### 10. Running a multi-line script
Example for `bash shell`:
```
# syntax=docker/dockerfile:1
FROM debian
RUN <<EOT bash
  set -ex
  apt-get update
  apt-get install -y vim
EOT
```

Example for `default shell`:
```
# syntax=docker/dockerfile:1
FROM debian
RUN <<EOT
  mkdir -p foo/bar
EOT
```

#### 11. Creating inline file
Example:
```
# syntax=docker/dockerfile:1
FROM alpine
COPY <<EOF greeting.txt
hello world
EOF
```

### 4. Secret
* A build secret is any `piece of sensitive information`, such as a `password` or `API token`, consumed as part of your application's build process.
#### 1. Secret mount
Eg:
```
RUN --mount=type=secret,id=mytoken \
    TOKEN=$(cat /run/secrets/mytoken) ...
```

##### 1. CLI
The following example mounts the `environment variable KUBECONFIG` to `secret ID kube`, as a `file` in the build container at `/run/secrets/kube`.

```
docker build --secret id=kube,env=KUBECONFIG .
```

When you secrets from environment variables, you can `omit` the id parameter to bind the secret to a file with the same name as the variable.  the value of the API_TOKEN variable is mounted to `/run/secrets/API_TOKEN` in the build container

```
docker build --secret id=mytoken,src=$HOME/.aws/credentials .
```

The following example `mounts` the secret to a `/root/.aws/credentials` file in the `build container`.
```
docker build --secret id=API_TOKEN .
```

##### 2. Bake
```
variable "HOME" {
  default = null
}

target "default" {
  secret = [
    "id=mytoken,src=${HOME}/.aws/credentials"
  ]
}
```

#### 2. SSH mount
Example Dockerfile:
```
FROM alpine
ADD git@github.com:me/myprivaterepo.git /src/
```
```
docker buildx build --ssh default .
```

### 5. Annotation
Command:
```
docker build --push --annotation "foo=bar" .
docker build --tag <IMAGE> --push --annotation "index:foo=bar" .
docker build --tag <IMAGE> --push --annotation "index,manifest:foo=bar" .
docker build --tag <IMAGE> --push --annotation "manifest[linux/amd64]:foo=bar" .
```
Bake:
```
target "default" {
  output = ["type=registry"]
  annotations = ["foo=bar"]
}
```

### 6. Create base image
from scratch:

```
FROM scratch
ADD hello /
CMD ["/hello"]
```

command:
```
docker build --tag hello .
```

### 7. Builder
Builder drivers:
* docker: uses the BuildKit library bundled into the Docker daemon.
* docker-container: creates a dedicated BuildKit container using Docker.
* kubernetes: creates BuildKit pods in a Kubernetes cluster.
* remote: connects directly to a manually managed BuildKit daemon.

Command to list builders:
```
docker buildx ls
```
Command to use builder:

You can use environment variable `BUILDX_BUILDER` to set default builder

Command to create builder:
```
docker buildx create --name=<builder-name>
```

Command to inspect builder: 
```
docker buildx inspect --bootstrap my_builder
```

Command to see how much disk space a builder is using
```
docker buildx du --builder BUILDER
docker buildx du --builder my_builder
```

Command to remove builder:
docker buildx rm <builder-name>

## 8. Docker Compose
### 1. Version
Example:
```
name: myapp

services:
  foo:
    image: busybox
    command: echo "I'm running ${COMPOSE_PROJECT_NAME}"
```

### 2. Service

### 3. Network
#### 1. Example
* In the following example, at runtime, networks front-tier and back-tier are created and the frontend service is connected to front-tier and back-tier networks.
```
services:
  frontend:
    image: example/webapp
    networks:
      - front-tier
      - back-tier

networks:
  front-tier:
  back-tier:
```

#### 2. Advanced example
* The advanced example shows a Compose file which defines `two custom networks`. The `proxy service` is `isolated` from the `db service`, because they `do not share` a network in common. `Only app can talk to both`.
```
services:
  proxy:
    build: ./proxy
    networks:
      - frontend
  app:
    build: ./app
    networks:
      - frontend
      - backend
  db:
    image: postgres
    networks:
      - backend

networks:
  frontend:
    # Use a custom driver
    driver: custom-driver-1
  backend:
    # Use a custom driver which takes special options
    driver: custom-driver-2
    driver_opts:
      foo: "1"
      bar: "2"
```

#### 3. driver
```
networks:
  db-data:
    driver: bridge
```

#### 4. driver_opts
```
networks:
  db-data:
    driver_opts:
      foo: "bar"
      baz: 1
```

#### 5. attachable
* If attachable is set to true, then `standalone containers` should be `able to attach to this network`, in addition to services. If a standalone container attaches to the network, it can communicate with services and other standalone containers that are also attached to the network.
```
networks:
  mynet1:
    driver: overlay
    attachable: true
```

#### 6. enable_ipv6
Can enable `ipv6` use `daemon config file`:
```
{
  "experimental": true,
  "ip6tables": true
}
```

#### 7. external
* external specifies that this network’s lifecycle is maintained outside of that of the application. Compose doesn't attempt to create these networks, and returns an error if one doesn't exist.
```
services:
  proxy:
    image: example/proxy
    networks:
      - outside
      - default
  app:
    image: example/app
    networks:
      - default

networks:
  outside:
    external: true
```

#### 8. ipam
* driver: Custom IPAM driver, instead of the default.
* config: A list with zero or more configuration elements, each containing a:
  * subnet: Subnet in CIDR format that represents a network segment
  * ip_range: Range of IPs from which to allocate container IPs
  * gateway: IPv4 or IPv6 gateway for the master subnet
  * aux_addresses: Auxiliary IPv4 or IPv6 addresses used by Network driver, as a mapping from hostname to IP
* options: Driver-specific options as a key-value mapping.

```
networks:
  mynet1:
    ipam:
      driver: default
      config:
        - subnet: 172.28.0.0/16
          ip_range: 172.28.5.0/24
          gateway: 172.28.5.254
          aux_addresses:
            host1: 172.28.1.5
            host2: 172.28.1.6
            host3: 172.28.1.7
      options:
        foo: bar
        baz: "0"
```

#### 9. internal
By default, Compose provides external connectivity to networks. internal, when set to true, allows you to create an externally isolated network.


#### 10. labels
Add `metadata` to containers using labels. You can use either an `array or a dictionary`.
```
networks:
  mynet1:
    labels:
      com.example.description: "Financial transaction network"
      com.example.department: "Finance"
      com.example.label-with-empty-value: ""
```
```
networks:
  mynet1:
    labels:
      - "com.example.description=Financial transaction network"
      - "com.example.department=Finance"
      - "com.example.label-with-empty-value"
```

#### 11. name
```
networks:
  network1:
    name: my-app-net
```
```
networks:
  network1:
    external: true
    name: "${NETWORK_ID}"
```

### 4. Volume
#### 1. Example

* The following example shows a `two-service` setup where a database's data directory is `shared with another service` as a volume, named `db-data`, so that it can be periodically backed up
* Running docker compose up creates the volume if it doesn't already exist. Otherwise, the existing volume is used and is recreated if it's manually deleted outside of Compose.
```
services:
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data

  backup:
    image: backup-service
    volumes:
      - db-data:/var/lib/backup/data

volumes:
  db-data:
```

#### 2. Driver
* If the driver is not available, Compose returns an error and doesn't deploy the application.
```
volumes:
  db-data:
    driver: foobar
```

#### 3. driver_opts
* driver_opts specifies a list of options as key-value pairs to pass to the driver for this volume. The options are driver-dependent.
```
volumes:
  example:
    driver_opts:
      type: "nfs"
      o: "addr=10.40.0.199,nolock,soft,rw"
      device: ":/docker/example"
```

#### 4. external
If set to true:

* external specifies that this volume already exists on the platform and its lifecycle is managed outside of that of the application. Compose doesn't then create the volume, and returns an error if the volume doesn't exist
* All other attributes apart from name are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.

```
services:
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data

volumes:
  db-data:
    external: true
```

#### 5. labels
* labels are used to add metadata to volumes. You can use either an array or a dictionary.

```
volumes:
  db-data:
    labels:
      com.example.description: "Database volume"
      com.example.department: "IT/Ops"
      com.example.label-with-empty-value: ""
```
```
volumes:
  db-data:
    labels:
      - "com.example.description=Database volume"
      - "com.example.department=IT/Ops"
      - "com.example.label-with-empty-value"
```

#### 6. name
```
volumes:
  db-data:
    name: "my-app-data"
```

### 5. Config
* file: The config is created with the `contents of the file` at the specified path.
* environment: The config content is created with the `value of an environment variable`.
* content: The content is created with the `inlined value`.
* external: If set to true, external specifies that `this config has already been created`. Compose does not attempt to create it, and if it does not exist, an error occurs.
* name: The name of the config object in the container engine to look up. This field can be used to reference configs that contain special characters. The name is used as is and will not be scoped with the project name.

file:
```
configs:
  http_config:
    file: ./httpd.conf
```

environment variable:
```
secrets:
  token:
    environment: "OAUTH_TOKEN"
```

external: 
```
configs:
  http_config:
    external: true
```

Inline: 
```
configs:
  app_config:
    content: |
      debug=${DEBUG}
      spring.application.admin.enabled=${DEBUG}
      spring.application.name=${COMPOSE_PROJECT_NAME}
```

name: 
```
configs:
  http_config:
    external: true
    name: "${HTTP_CONFIG_KEY}"
```

### 6. Secret

file: The secret is created with the contents of the `file` at the specified path.
```
secrets:
  server-certificate:
    file: ./server.cert
```

environment: The secret is created with the value of an `environment variable`.
```
secrets:
  token:
    environment: "OAUTH_TOKEN"
```

### 7. Build
#### 1. Example
Example:
```
services:
  frontend:
    image: example/webapp
    build: ./webapp

  backend:
    image: example/database
    build:
      context: backend
      dockerfile: ../backend.Dockerfile

  custom:
    build: ~/custom
```
* build example/webapp image use Dockerfile in `./webapp` which mean child folder and run service
* build example/database image use backend.Dockerfile in `..` which mean parent folder and run service
* custom build context `~/custom`

#### 2. From a remote URL [ Github ]:
```
services:
  webapp:
    build: https://github.com/mycompany/example.git#branch_or_tag:subdirectory
```
* build `webapp service` from a `remote URL`

#### 3. dockerfile specify:
```
build:
  context: .
  dockerfile: webapp.Dockerfile
```
* build service from in `current directory` but specify `webapp.Dockerfile as Dockerfile`

#### 4. dockerfile_inline:
```
build:
  context: .
  dockerfile_inline: |
    FROM baseimage
    RUN some command
```
#### 5. Arguments
Example dockerfile:
```
ARG GIT_COMMIT
RUN echo "Based on commit: $GIT_COMMIT"
```

Pass mapping argument in `docker-compose.yaml`:
```
build:
  context: .
  args:
    GIT_COMMIT: cdc3b19
```

Pass list argument in `docker-compose.yaml`:
```
build:
  context: .
  args:
    - GIT_COMMIT=cdc3b19
```

#### 6. ssh
* ssh defines SSH authentications that the image builder should use during image build (e.g., cloning private repository)
```
build:
  context: .
  ssh:
    - default   # mount the default ssh agent
```
```
build:
  context: .
  ssh: ["default"]   # mount the default ssh agent
```

Using a custom id myproject with path to a local SSH key:
```
build:
  context: .
  ssh:
    - myproject=~/.ssh/myproject.pem
```
#### 7. cache_from
#### 8. cache_to
#### 9. additional_contexts
#### 10. extra_hosts
#### 11. isolation
#### 12. privileged
#### 13. labels
#### 14. pull
#### 15. network
#### 16. shm_size
#### 17. target
#### 18. secrets
#### 19. tags
Tagging:
```
build:
 tags:
   - "myimage:mytag"
   - "registry/username/myrepos:my-other-tag"
```

#### 20. ulimits
#### 21. platforms
```
build:
  context: "."
  platforms:
    - "linux/amd64"
    - "linux/arm64"
```

Note: When the platforms attribute is `omitted`, Compose includes the service's platform in the list of the `default` build target platforms.

Composes reports an error in the following cases:
* When the list contains multiple platforms but the implementation is `incapable of storing multi-platform images`.
* When the list contains an unsupported platform.
```
build:
  context: "."
  platforms:
    - "linux/amd64"
    - "unsupported/unsupported"
```

* When the list is non-empty and does not contain the service's platform. [ when build platform does not include platfrom from service ]
```
services:
  frontend:
    platform: "linux/amd64"
    build:
      context: "."
      platforms:
        - "linux/arm64"
```

### 8. Deploy
#### 1. endpoint_mode
```
services:
  frontend:
    image: example/webapp
    ports:
      - "8080:80"
    deploy:
      mode: replicated
      replicas: 2
      endpoint_mode: vip
```

There are two endpoint_mode:
* endpoint_mode: vip [ Assigns the service a virtual IP (VIP) that acts as the front end for clients to reach the service on a network ]
* endpoint_mode: dnsrr [ Platform sets up DNS entries for the service such that a DNS query for the service name returns a list of IP addresses (DNS round-robin), and the client connects directly to one of these ]

#### 2. labels
labels specifies `metadata` for the `service`. These labels are `only` set on the `service` and `not` on any `containers` for the service
```
services:
  frontend:
    image: example/webapp
    deploy:
      labels:
        com.example.description: "This label will appear on the web service"
```

#### 3. mode
mode defines the replication model used to run the service on the platform. Either `global`, exactly `one container per physical node`, or `replicated`, a `specified number of containers`. The `default` is `replicated`
```
services:
  frontend:
    image: example/webapp
    deploy:
      mode: global
```

#### 4. placement
##### 1. constraints
defines a required property the platform's node `must` fulfill to run the service container. It can be set either by a list or a map with string values.

```
deploy:
  placement:
    constraints:
      - disktype=ssd
```
```
deploy:
  placement:
    constraints:
      disktype: ssd
```

##### 2. preferences
defines a required property the platform's node `should` fulfill to run the service container. It can be set either by a list or a map with string values.
```
deploy:
  placement:
    preferences:
      - datacenter=us-east
```
```
deploy:
  placement:
    preferences:
      datacenter: us-east
```

#### 5. replicas
replicas specifies the `number of containers` that should be running at any given time.
```
services:
  frontend:
    image: example/webapp
    deploy:
      mode: replicated
      replicas: 6
```

#### 6. resources
* limits: The platform must prevent the container to allocate more.
* reservations: The platform must guarantee the container can allocate at least the configured amount.
```
ervices:
  frontend:
    image: example/webapp
    deploy:
      resources:
        limits:
          cpus: '0.50'
          memory: 50M
          pids: 1
        reservations:
          cpus: '0.25'
          memory: 20M
```

#### 7. restart_policy
Conditions:
* none, containers are not automatically restarted regardless of the exit status.
* on-failure, the container is restarted if it exits due to an error, which manifests as a non-zero exit code
* any (default), containers are restarted regardless of the exit status

```
deploy:
  restart_policy:
    condition: on-failure
    delay: 5s
    max_attempts: 3
    window: 120s
```

#### 8. rollback_config
* parallelism: The number of containers to update at the same time.
* delay: The time to wait between updating a group of containers.
* failure_action: What to do if an update fails. One of continue, rollback, or pause (default: pause).
* monitor: Duration after each task update to monitor for failure (ns|us|ms|s|m|h) (default 0s).
* max_failure_ratio: Failure rate to tolerate during an update.
* order: Order of operations during updates. One of stop-first (old task is stopped before starting new one), or start-first

```
deploy:
  update_config:
    parallelism: 2
    delay: 10s
    order: stop-first
```

#### 9. update_config
* parallelism: The number of containers to update at the same time.
* delay: The time to wait between updating a group of containers.
* failure_action: What to do if an update fails. One of continue, rollback, or pause (default: pause).
* monitor: Duration after each task update to monitor for failure (ns|us|ms|s|m|h) (default 0s).
* max_failure_ratio: Failure rate to tolerate during an update.
* order: Order of operations during updates. One of stop-first (old task is stopped before starting new one), or start-first

```
deploy:
  update_config:
    parallelism: 2
    delay: 10s
    order: stop-first
```

### 9. Develop


## 9. Docker Swarm
Swarm mode uses TLS to encryption, authentication nodes , authorize roles. It has machanism of automatic key rotation

Manager nodes: Although you have `many manager nodes`, but `one` of them is considered `active`. This call `manager node`

Swarm uses `Raft consensus algorithm`
* Best practices
  * Deploy an odd number of managers ( to against split brain )
  * Dont deploy to many manager nodes ( Just 3 or 5 ) ( More nodes mean more time to consensus )

## 10. Service
Is a set of `containers` with same `config, image,...`

Docker swarm run a reconcilation loop that constantly compares actual state and disire state. If they are not match, the swarm take action so that they do 

Eg: If you run a service with `5 replicas`, by an unknown reason your replicas is `4`, after monitor and compare it will create a `new replica`

Every node gets a mapping that can redirect your request to a node that runs a service

## 11. Overlay network [ Over layer network ]
Eg: network that connect multiple subnet CIDR together

Command to create overlay network:
```
docker network create -d overlay NETWORK_NAME
```
* The `control plane` is encrypt with TLS by default
* If your want to encrypt the `data plane` just add `-o` add the end of command.
* Overlay network just made `available to nodes`, which `run containers` that `attached to overlay`
* Note: Overlay network CIDR does not need to match physical CIDR, and each container has their own IP address from the network CIDR.

## 12. How overlay network works
* Overlay network leverages VXLAN tunnel to create virtual Layer 2 overlay network
* It create a network namespace on each host [ a network namespace is like a container but instead of running application, it runs an isolated network stack

* Architecture
  * A virtual switch ( virtual bridge ) is created in network namespace
  * `A VXLAN Tunnel End Point` is created with one end plumbed into `virtual switch` and another plumbed into `host network stack`
  * The end of the `network stack` get an `IP address` that is bound to `a UDP socket` on port `4789`
  * Each container get it's own `Virtual Ethernet` ( veth ) adapter that `plumbed into virtual bridge`

## 13. Security in Docker
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

## 14. My way
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

## 15. Docker Daemon
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
