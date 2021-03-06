# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Overhead Camera System for Tracking AR Tags"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/gt-rail-release/rail_ceiling-release/archive/release/indigo/rail_ceiling/0.0.4-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/ar_track_alvar
	ros-indigo/ar_track_alvar_msgs
	ros-indigo/geometry_msgs
	ros-indigo/image_view
	ros-indigo/robot_state_publisher
	ros-indigo/roscpp
	ros-indigo/roslib
	ros-indigo/tf
	ros-indigo/usb_cam
	ros-indigo/xacro
	dev-cpp/yaml-cpp
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
	virtual/pkgconfig
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

