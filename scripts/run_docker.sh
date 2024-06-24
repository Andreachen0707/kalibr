# docker build -t kalibr -f Dockerfile_ros1_20_04 . # change this to whatever ubuntu version you want

FOLDER=/home/andreachen/work/kalibr
xhost +local:root
docker run \
    -it \
    --name kalibr_dev \
    -e DISPLAY=:0 \
    -e "QT_X11_NO_MITSHM=1" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "$FOLDER:/data" \
    --workdir /workspaces/kalibr \
    kalibr