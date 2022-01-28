#!/bin/bash
#Stop all machines
docker stop $(docker ps -a -q)

#stop all containers by force
docker kill $(docker ps -q)

#Removes all machines
docker rm -f $(docker ps -aq) >/dev/null 2>&1 || true

#Removes all images
docker rmi -f $(docker images -q)

#purge the rest
docker system prune --all --force --volumes

#removes interface of docker
ip link delete docker0

#Removes all iptable routes
iptables -F

exit 0
