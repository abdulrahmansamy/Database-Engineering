# Galera Loadbalancer Configration

## Node Management

### Add Node
At loadbalancer node run this:
```
sudo service glb add <Node IP>:3306:1
```
After the last colon set the `node weight`
here the node weight is `1`

### Remove Node
```
sudo service glb remove <Node IP>0:3306
```

## Performance Stats

### Query stats

```
sudo service glb getstats
```