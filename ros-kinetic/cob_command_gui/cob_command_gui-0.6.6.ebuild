# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="This package provides a simple GUI for operating Care-O-bot."
HOMEPAGE="http://www.ros.org/wiki/cob_command_gui"
SRC_URI="https://github.com/ipa320/cob_command_tools-release/archive/release/kinetic/cob_command_gui/0.6.6-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="LGPL-2"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/cob_msgs
	ros-kinetic/cob_script_server
	ros-kinetic/roslib
	ros-kinetic/rospy
	dev-python/pygraphviz
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

