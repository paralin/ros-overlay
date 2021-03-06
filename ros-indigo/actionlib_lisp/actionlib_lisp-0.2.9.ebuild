# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="actionlib_lisp is a native implementation of the famous actionlib   in Common L"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/roslisp_common-release/archive/release/indigo/actionlib_lisp/0.2.9-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/actionlib_msgs
	ros-indigo/cl_utils
	ros-indigo/message_runtime
	ros-indigo/roslisp
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

