#!/bin/bash
docker container prune
docker volume prune
systemctl restart docker.service
exit 0 
