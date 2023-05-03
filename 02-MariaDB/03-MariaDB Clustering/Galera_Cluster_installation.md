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

```
chmod 600 /swapfile
ll -h /swapfile
```

```
mkswap /swapfile
swapon /swapfile
```

```
cat << EOF >> /etc/fstab

/swapfile none swap defaults 0 0
EOF
```
Check the swap configuration

```
swapon --summary
```
