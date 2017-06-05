# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="rqt_plot provides a GUI plugin visualizing numeric values in a 2D plot using dif"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/rqt_plot-release/archive/release/lunar/rqt_plot/0.4.8-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-lunar/python_qt_binding
    ros-lunar/qt_gui_py_common
    ros-lunar/qwt_dependency
    ros-lunar/rosgraph
    ros-lunar/rostopic
    ros-lunar/rqt_gui
    ros-lunar/rqt_gui_py
    ros-lunar/rqt_py_common
    ros-lunar/std_msgs
    dev-python/matplotlib
    dev-python/numpy
    dev-python/rospkg
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
