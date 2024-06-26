# docker build -t kalibr -f Dockerfile_ros1_20_04 . # change this to whatever ubuntu version you want

CONFIG_FOLDER=/home/jerel/dev/kalibr/datasets/config
DATA_FOLDER=/home/jerel/dev/kalibr/datasets/kalibr_data2
xhost +local:root
docker run \
    -it \
    --rm \
    --name kalibr_dev \
    -e DISPLAY=:0 \
    -e "QT_X11_NO_MITSHM=1" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "$DATA_FOLDER:/data" \
    -v "$CONFIG_FOLDER:/config" \
    --workdir /workspaces/kalibr \
    kalibr