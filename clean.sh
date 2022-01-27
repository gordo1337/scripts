#!/bin/bash
#Clear PageCache
sync; echo 1 > /proc/sys/vm/drop_caches
#Clear dentries and inodes
sync; echo 2 > /proc/sys/vm/drop_caches
#Clear pagecache, dentries, and inodes
sync; echo 3 > /proc/sys/vm/drop_caches
#Cleans repos and stuff with zypper
zypper clean -a
#Update
zypper refresh
exit 0
