#!/bin/bash
docker container prune
docker volume prune
docker restart
exit 0
