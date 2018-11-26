# Dockerized h2 database

This repository contains `H2 Database` image from `www.h2database.com`
work based on https://github.com/1000kit/docker-h2

### Installed versions:

Latest H2 DB version 1.4.197
based on Docker Alpine Java 8 JRE image

### Availability

### Info

- User `h2` in image is used for execution
- start script: `/opt/h2/bin/h2-start.sh`
- Volume `/opt/h2-data` can be used for persistance
- Ports: `8181` and `1521` are exposed 

## Build Image

Take a Dockerfile and build with the default arguments:

```bash
$ docker build -t h2 .
```

## Run

### docker

```bash
$ docker run -it 1000kit/h2
```

Alternative using persistent data:

```bash
$ docker run -v <host_local_datadir>:/opt/h2-data -it 1000kit/h2
```

### docker-compose

Download `docker-compose.yml` from github. If you need persistence uncomment the volume settings in `docker-compose.yml` file. 

```bash
$ docker-compose up -d
```