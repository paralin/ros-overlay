# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="This package depends on a recent version of the Kinematics and Dynamics	Libr"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/smits/orocos-kdl-release/archive/release/kinetic/orocos_kinematics_dynamics/1.3.1-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="LGPL-2"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/orocos_kdl
	ros-kinetic/python_orocos_kdl
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

