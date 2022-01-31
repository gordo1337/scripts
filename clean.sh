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
#cd ~/scripts
#execute permission
#chmod 755 clean.sh
# Now you may call the script whenever you are required to clear the ram cache.
# Now set a cron to clear RAM cache every day at 2 am. Open crontab for editing.
#crontab -e
# Append the below line, save and exit to run it at 2 am daily.
#0  2  *  *  *  ~/scripts/clean.sh

#Kubernetes components and secrets leave behind mounts on the system that need to be unmounted.
for mount in $(mount | grep tmpfs | grep '/var/lib/kubelet' | awk '{ print $3 }') /var/lib/kubelet /var/lib/rancher; do umount $mount; done

#Clean directorys before a rancher restet. 
rm -rf /etc/ceph \
       /etc/cni \
       /etc/kubernetes \
       /opt/cni \
       /opt/rke \
       /run/secrets/kubernetes.io \
       /run/calico \
       /run/flannel \
       /var/lib/calico \
       /var/lib/etcd \
       /var/lib/cni \
       /var/lib/kubelet \
       /var/lib/rancher/rke/log \
       /var/log/containers \
       /var/log/kube-audit \
       /var/log/pods \
       /var/run/calico
      
#removes iptables
iptables -F
# Installs docker
zypper install -y docker
#enables
systemctl enable docker
#starts
systemctl start docker

#Allow tcp forward
sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/g' /etc/ssh/sshd_config
# Restart sshd
systemctl restart sshd
       
exit 0
