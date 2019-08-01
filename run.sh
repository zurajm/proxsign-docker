export XSOCK=/tmp/.X11-unix
export XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker build -t proxsign .

docker run -ti \
        --volume=$XSOCK:$XSOCK:rw \
        --volume=$XAUTH:$XAUTH:rw \
        --volume=$PWD/data:/home/proxsign:rw \
        --env="XAUTHORITY=${XAUTH}" \
        --env="DISPLAY" \
        -p 14972:14972 \
		proxsign
