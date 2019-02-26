#!/usr/bin/env bash
# steps taken for RHEL 7 install

# sudo -u ec2-user command  # non-sudo command when whole script is called with sudo

sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install epel-release
sudo yum -y update
sudo yum -y install python34 python34-devel python34-pip python34-numpy

sudo yum -y install git gcc gcc-c++ cmake cmake3
sudo yum -y install qt5-qtbase-devel

sudo yum -y install gtk2-devel

sudo rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
sudo yum install -y ffmpeg
sudo yum install -y ffmpeg-devel

sudo yum install -y libpng-devel
sudo yum install -y openexr-devel
sudo yum install -y libwebp-devel
sudo yum -y install libjpeg-turbo-devel
sudo yum install -y freeglut-devel mesa-libGL mesa-libGL-devel
sudo yum -y install libtiff-devel
sudo yum -y install libdc1394-devel --skip-broken
sudo yum -y install tbb-devel eigen3-devel
sudo yum -y install boost boost-thread boost-devel
sudo yum -y install python34-tkinter.x86_64

sudo pip3 install virtualenv
virtualenv --system-site-packages ~/tensorflow
source ~/tensorflow/bin/activate
pip install --force-reinstall pip==9.0.3
pip install numpy scipy matplotlib pillow ipython scikit-image==0.13 scikit-learn dlib
pip install tensorflow

# install opencv4
cvVersion="master"
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout $cvVersion
cd ..

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout $cvVersion
cd ..

cd opencv
mkdir build
cd build

cmake3 -D CMAKE_BUILD_TYPE=RELEASE \
            -D CMAKE_INSTALL_PREFIX=$cwd/installation/OpenCV-"$cvVersion" \
            -D INSTALL_C_EXAMPLES=ON \
            -D INSTALL_PYTHON_EXAMPLES=ON \
            -D WITH_TBB=ON \
            -D WITH_V4L=ON \
            -D OPENCV_SKIP_PYTHON_LOADER=ON \
            -D OPENCV_GENERATE_PKGCONFIG=ON \
            -D OPENCV_PYTHON3_INSTALL_PATH=$HOME/.virtualenvs/OpenCV-$cvVersion-py3/lib/python3.4/site-packages \
        -D WITH_QT=ON \
        -D WITH_OPENGL=ON \
        -D PYTHON_DEFAULT_EXECUTABLE=/usr/bin/python3 \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D ENABLE_CXX11=ON \
        -D BUILD_EXAMPLES=ON ..

make -j$(nproc)
sudo make install

# install ocr additional dependencies
pip install Shapely
pip install imutils
pip install editdistance
