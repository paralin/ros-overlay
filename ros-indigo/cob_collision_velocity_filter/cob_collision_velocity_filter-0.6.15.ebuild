# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="The cob_collision_velocity_filter package is a package for collision avoidance u"
HOMEPAGE="http://ros.org/wiki/cob_collision_velocity_filter"
SRC_URI="https://github.com/ipa320/cob_control-release/archive/release/indigo/cob_collision_velocity_filter/0.6.15-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="LGPL-2"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/cob_footprint_observer
	ros-indigo/costmap_2d
	ros-indigo/dynamic_reconfigure
	ros-indigo/geometry_msgs
	ros-indigo/nav_msgs
	ros-indigo/roscpp
	ros-indigo/tf
	ros-indigo/visualization_msgs
	dev-libs/boost
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

