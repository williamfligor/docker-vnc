# Docker VNC


```bash
docker build \
    --pull \
    -t vnc \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    .

docker run \
    -d \
    --rm \
    -p 5900:5900 \
    vnc
```
