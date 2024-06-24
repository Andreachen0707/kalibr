# data needs to be put under folder like this:
# - dataset-dir
#   - cam_0
#       - <timestamp0>.png
#       - <timestamp1>.png
#       - <timestamp2>.png
#       - <timestamp3>.png
#   - imu.csv

# create data bag
kalibr_bagcreater --folder dataset-dir/. --output-bag databag.bag

# within docker, run ros related
source devel/setup.bash
rosrun kalibr kalibr_calibrate_cameras \
 	--target april_6x6.yaml \
 	--models pinhole-radtan \
 	--topics /cam0/image_raw \
 	--bag cam_april.bag \
 	--bag-freq 10.0

rosrun kalibr kalibr_calibrate_imu_camera \
	--target april_6x6.yaml \
	--imu imu_adis16448.yaml \
	--imu-models calibrated \
	--cam cam_april-camchain.yaml \
	--bag imu_april.bag
