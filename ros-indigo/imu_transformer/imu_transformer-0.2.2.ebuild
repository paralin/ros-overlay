# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Node/nodelet combination to transform sensor_msgs::Imu data from one frame into "
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/imu_pipeline-release/archive/release/indigo/imu_transformer/0.2.2-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="GPL-1"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/geometry_msgs
	ros-indigo/message_filters
	ros-indigo/nodelet
	ros-indigo/roscpp
	ros-indigo/roslaunch
	ros-indigo/sensor_msgs
	ros-indigo/tf
	ros-indigo/tf2
	ros-indigo/tf2_ros
	ros-indigo/tf2_sensor_msgs
	ros-indigo/topic_tools
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

