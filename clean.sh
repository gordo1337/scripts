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
#Moving to the dir
cd ~/scripts
#execute permission
chmod 755 clean.sh
# Now you may call the script whenever you are required to clear the ram cache.
# Now set a cron to clear RAM cache every day at 2 am. Open crontab for editing.
crontab -e
# Append the below line, save and exit to run it at 2 am daily.
0  2  *  *  *  ~/scripts/clean.sh
exit 0
