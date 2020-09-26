# Docker

## Delete images, containers, volumes

```
docker system prune -a
```

## Delete all images

```
docker rmi $(docker images -a -q)
```

## Delete dangling images

Image layers that have no connection to tagged

```
docker image prune
```

## Stop all containers

```
docker stop $(docker ps -a -q)
```
