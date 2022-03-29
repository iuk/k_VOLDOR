export CURRENT_UID=$(id -u)
export CURRENT_PATH=$(pwd)

sudo docker run -it --shm-size 50G --entrypoint='/bin/bash' \
    -u $CURRENT_UID -e USER="docker" --gpus all \
    --privileged \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    --net=host -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro \
    -v $HOME:$HOME \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -w $CURRENT_PATH \
    kvoldor:latest