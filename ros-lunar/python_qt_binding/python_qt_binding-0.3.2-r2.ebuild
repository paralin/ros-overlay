# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This stack provides Python bindings for Qt.
    There are two providers: pyside "
HOMEPAGE="http://ros.org/wiki/python_qt_binding"
SRC_URI="https://github.com/ros-gbp/python_qt_binding-release/archive/release/lunar/python_qt_binding/0.3.2-2.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    dev-python/PyQt5
"
DEPEND="${RDEPEND}
    ros-lunar/catkin
    ros-lunar/rosbuild
    dev-qt/qtcore
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
