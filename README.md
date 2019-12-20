# docker

## Different Images
Each folder contains a different Dockerfile for building a new image and a shell script to help launch the instance. These scripts have been tested on Linux, and may not work on  Windows or Mac

## Connecting to the image
You should be connecting to the IP of the container with a port of 8888 for example
```
172.17.02:8888/lab
172.17.02:8888/?token=.....
```
You can inspect the docker network to discover the ip addresses:

```
docker network inspect
```
or list all container ip addresses

```
docker inspect -f '{{.Name}} - {{.NetworkSettings.IPAddress }}' $(docker ps -aq)

```
