# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="homer_mapping"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://gitlab.uni-koblenz.de/robbie/homer_mapping/repository/archive.tar.gz?ref=release/kinetic/homer_mapping/0.1.17-1 -> ${P}-${PV}.tar.gz"

LICENSE="GPL-3"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-kinetic/homer_mapnav_msgs
    ros-kinetic/homer_nav_libs
    ros-kinetic/nav_msgs
    ros-kinetic/roscpp
    ros-kinetic/roslib
    ros-kinetic/sensor_msgs
    ros-kinetic/std_msgs
    ros-kinetic/tf
    dev-cpp/eigen
    dev-qt/qtcore
    dev-qt/qtgui
    dev-qt/qtwidgets
"
DEPEND="${RDEPEND}
    dev-python/catkin
    ros-kinetic/catkin
    ros-kinetic/cmake_modules
    dev-qt/qtcore
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

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
    export PYTHONPATH="/${ROS_PREFIX}/lib/python3.5/site-packages:${PYTHONPATH}"
    export PYTHONPATH="/${ROS_PREFIX}/lib64/python3.5/site-packages:${PYTHONPATH}"
    export PYTHONPATH="${D}/${ROS_PREFIX}/lib/python3.5/site-packages:${PYTHONPATH}"
    export PYTHONPATH="${D}/${ROS_PREFIX}/lib64/python3.5/site-packages:${PYTHONPATH}"
    if [[ ! -d ${D}/${ROS_PREFIX}/lib64/python3.5/site-packages ]]; then
        mkdir -p ${D}/${ROS_PREFIX}/lib64/python3.5/site-packages
    fi

    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}