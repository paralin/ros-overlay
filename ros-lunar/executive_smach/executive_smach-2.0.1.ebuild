# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="This metapackage depends on the SMACH library and ROS SMACH integration
	pack"
HOMEPAGE="http://ros.org/wiki/smach"
SRC_URI="https://github.com/ros-gbp/executive_smach-release/archive/release/lunar/executive_smach/2.0.1-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-lunar/smach
	ros-lunar/smach_msgs
	ros-lunar/smach_ros
"
DEPEND="${RDEPEND}
	ros-lunar/catkin
"

SLOT="0"
ROS_DISTRO="lunar"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

