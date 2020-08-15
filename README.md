# Docker VNC

## Build and Run Image

**WARNING**: By default the image will expose a *passwordless* VNC Server with *no authentication* requirements. To require a password attach a volume to `/code/` or `/run/secrets` with a `.vncpasswd` file in it.

```bash
docker build \
    --pull \
    -t vnc \
    --build-arg FROM=ubuntu:18.04 -u) \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    .

docker run \
    -d \
    --rm \
    -p 5900:5900 \
    vnc
```

## Resize the VNC Screen

```
# Inside a terminal while connected via VNC
resize <width> <height> <refresh rate>

# Example
resize 1920 1080 60
```
