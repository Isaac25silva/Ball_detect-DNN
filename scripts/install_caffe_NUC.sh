blue='\e[0;34m'
light_Green='\e[1;32m'
NC='\e[0m' # No Color

#updates/system changes
echo -e "${blue} Upgrade ${NC}"
sudo apt -y upgrade
echo -e "${blue} Update ${NC}"
sudo apt -y update

echo -e "${blue} Install softwares...${NC}"

sleep 2

#pip
sudo apt -y install python-pip

sudo -H pip install imutils

sudo -H pip install --upgrade pip #Nao ha necessidade, a nao ser q a versao do pip seja muito antiga

#Construct 2.5.3
sudo pip install construct==2.5.3

#Upgrade numpy
sudo -H pip install --upgrade numpy

#Cython
sudo -H pip install Cython

#scikit-image
sudo -H pip install scikit-image

#Protobuth
sudo -H pip install protobuf

#============================Install Opencv 3===================================================================


echo -e "${blue}Install Dependence${NC}"
sudo apt -y install build-essential
#sudo apt -y install aptitude
#sudo aptitude -y install libgtk2.0-dev
sudo apt -y install qt-sdk
sudo apt -y install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt -y install python-dev libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev


echo -e "${blue}Clone to GitHub${NC}"
sudo rm  -r ~/OpenCV3
mkdir ~/OpenCV3
cd ~/OpenCV3
git clone https://github.com/Itseez/opencv.git


echo -e "${blue}Run CMake${NC}"
cd opencv
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_GTK=ON -D WITH_OPENGL=ON ..

echo -e "${blue}Copile and install${NC}"
make -j4 # Numero de processadores na maquina
sudo make install

echo -e "${light_Green}Finish${NC}"
sudo rm  -r ~/OpenCV3
sleep 1
#=========================================================================================================================



#============================Install Caffe================================================================================
# General Dependencies
sudo apt -y install --no-install-recommends libboost-all-dev

sudo apt -y install libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev #Retirei a biblioteca libopencv-dev devido a possibilidade de conflito com a versao do opencv instalado

# Remaining dependencies
sudo apt -y install libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler

#sudo apt install libopenblas-dev

# BLAS -- for better CPU performance
sudo apt -y install libatlas-base-dev

#scikit-image
sudo -H pip install scikit-image

#Protobuth
sudo -H pip install protobuf

cd

#Caffe
#git clone https://github.com/NVIDIA/caffe.git
git clone http://github.com/BVLC/caffe.git
cd caffe
cp Makefile.config.example Makefile.config
sed -i 's/.*CPU_ONLY := 1/CPU_ONLY := 1/g' Makefile.config # CPU only
sed -i 's/.*OPENCV_VERSION := 3/OPENCV_VERSION := 3/' Makefile.config # PENCV_VERSION 3
make -j4
make test
make runtest
make pycaffe
echo 'export PYTHONPATH=~/caffe/python' >> ~/.bashrc
echo 'export CAFFE_ROOT=~/caffe' >> ~/.bashrc
#=========================================================================================================================


echo -e "${blue} Autoremove ${NC}"
sudo apt -y autoremove

sudo apt install -f

echo -e "${blue} Update ${NC}"
sudo apt -y update

echo -e "${blue} Configuration end ${NC}"
