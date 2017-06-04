# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Controller for executing joint-space trajectories on a group of joints."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/ros_controllers-release/archive/release/indigo/joint_trajectory_controller/0.9.3-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/actionlib
    ros-indigo/angles
    ros-indigo/control_msgs
    ros-indigo/control_toolbox
    ros-indigo/controller_interface
    ros-indigo/controller_manager
    ros-indigo/hardware_interface
    ros-indigo/realtime_tools
    ros-indigo/roscpp
    ros-indigo/rostest
    ros-indigo/rqt_plot
    ros-indigo/trajectory_msgs
    ros-indigo/urdf
    ros-indigo/xacro
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
    ros-indigo/cmake_modules
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

src_unpack() {
    default
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    cd ../../work
    source /${ROS_PREFIX}/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}