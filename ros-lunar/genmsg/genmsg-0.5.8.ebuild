# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Standalone Python library for generating ROS message and service data structures"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/genmsg-release/archive/release/lunar/genmsg/0.5.8-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-lunar/catkin
"
DEPEND="${RDEPEND}
"

SLOT="0"
ROS_DISTRO="lunar"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

