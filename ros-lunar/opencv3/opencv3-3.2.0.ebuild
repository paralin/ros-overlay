# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="OpenCV 3.x"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/opencv3-release/archive/release/lunar/opencv3/3.2.0-6.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/catkin
    dev-libs/protobuf
    media-libs/libwebp
    virtual/ffmpeg
    media-libs/libjpeg-turbo
    dev-lang/python
    sys-libs/zlib
    media-libs/libpng
    dev-python/numpy
    sci-libs/vtk
"
DEPEND="${RDEPEND}
    dev-libs/protobuf
    media-libs/tiff
    media-libs/libv4l
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/lunar"

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
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
    source /opt/ros/lunar/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}"
    rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
    rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
}
