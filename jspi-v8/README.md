```bash
# ok
$ node --version
v23.11.1
$ node -p process.versions.v8
12.9.202.28-node.14

# with node 24
# RangeError: Maximum call stack size exceeded 
$ node --version
v24.0.0
$ node -p process.versions.v8
13.6.233.8-node.10
```
