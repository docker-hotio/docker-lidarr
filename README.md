# lidarr

[![GitHub](https://img.shields.io/badge/source-github-lightgrey?style=flat-square)](https://github.com/hotio/docker-lidarr)
[![Docker Pulls](https://img.shields.io/docker/pulls/hotio/lidarr?style=flat-square)](https://hub.docker.com/r/hotio/lidarr)
[![Drone (cloud)](https://img.shields.io/drone/build/hotio/docker-lidarr?style=flat-square)](https://cloud.drone.io/hotio/docker-lidarr)

## Starting the container

Just the basics to get the container running:

```shell
docker run --rm --name lidarr -p 8686:8686 -v /tmp/lidarr:/config -e TZ=Etc/UTC hotio/lidarr
```

The environment variables below are all optional, the values you see are the defaults.

```shell
-e PUID=1000
-e PGID=1000
-e UMASK=022
-e VERSION=image
```

Possible values for `VERSION`:

```shell
VERSION=image
VERSION=stable
VERSION=unstable
VERSION=https://services.lidarr.audio/v1/update/nightly/updatefile?version=0.7.1.1574&os=linux&runtime=netcore&arch=x64
VERSION=file:///config/Lidarr.develop.0.7.1.1574.linux-core-x64.tar.gz
```

## Executing your own scripts

If you have a need to do additional stuff when the container starts or stops, you can mount your script with `-v /docker/host/my-script.sh:/etc/cont-init.d/99-my-script` to execute your script on container start or `-v /docker/host/my-script.sh:/etc/cont-finish.d/99-my-script` to execute it when the container stops. An example script can be seen below.

```shell
#!/usr/bin/with-contenv bash

echo "Hello, this is me, your script."
```
