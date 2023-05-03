# Galera Cluster Installation

## 1. Enable and Configure Swap Space

Check the currant swap space
```
swapon --summary
```

Create an empty file
```
fallocate -l 512M /swapfile
```
or
```
dd if=/dev/zero of=/swapfile bs=1M count=512
```

Assigne the permissions for the swap file
```
chmod 600 /swapfile
```

Check the swap file size and permissions
```
ll -h /swapfile
```

Format the swap file and turn it on: 
```
mkswap /swapfile
swapon /swapfile
```

Configure persistent swap mount
```
cat << EOF >> /etc/fstab

/swapfile none swap defaults 0 0
EOF
```
Check the swap configuration

```
swapon --summary
```
