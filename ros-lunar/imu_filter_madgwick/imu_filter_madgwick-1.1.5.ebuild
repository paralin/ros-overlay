# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Filter which fuses angular velocities, accelerations, and (optionally) magnetic "
HOMEPAGE="http://ros.org/wiki/imu_filter_madgwick"
SRC_URI="https://github.com/uos-gbp/imu_tools-release/archive/release/lunar/imu_filter_madgwick/1.1.5-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="GPL-1"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-lunar/dynamic_reconfigure
    ros-lunar/geometry_msgs
    ros-lunar/message_filters
    ros-lunar/nodelet
    ros-lunar/pluginlib
    ros-lunar/roscpp
    ros-lunar/sensor_msgs
    ros-lunar/tf2
    ros-lunar/tf2_geometry_msgs
    ros-lunar/tf2_ros
"
DEPEND="${RDEPEND}
    ros-lunar/catkin
"

SLOT="0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/lunar"

src_unpack() {
    default
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    mkdir ${WORKDIR}/${P}/build
    mkdir ${WORKDIR}/${P}/devel
    cd ${WORKDIR}/${P}/build
    cmake -DCMAKE_INSTALL_PREFIX=${D}/${ROS_PREFIX} -DCMAKE_PREFIX_PATH=/${ROS_PREFIX} -DCATKIN_DEVEL_PREFIX=../devel ..
    make -j$(nproc) -l$(nproc) || die
}

src_install() {
    cd ${WORKDIR}/${P}/build
    make install || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}
