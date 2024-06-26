# data needs to be put under folder like this:
# - dataset-dir
#   - cam_0
#       - <timestamp0>.png
#       - <timestamp1>.png
#       - <timestamp2>.png
#       - <timestamp3>.png
#   - imu.csv

# within docker, run ros related
source devel/setup.bash

rosrun kalibr kalibr_create_target_pdf --type apriltag --nx 6 --ny 6 --tsize 0.0589 --tspace 0.3

rosrun kalibr kalibr_bagcreater --folder /data --output-bag /data/data.bag

rosrun kalibr kalibr_calibrate_cameras \
 	--target /config/target.yaml \
 	--models pinhole-radtan \
 	--topics /cam0/image_raw \
 	--bag /data/data.bag

rosrun kalibr kalibr_calibrate_imu_camera \
	--target /config/target.yaml \
	--imu /config/imu.yaml \
	--imu-models calibrated \
	--cam /data/data-camchain.yaml \
	--bag /data/data.bag
