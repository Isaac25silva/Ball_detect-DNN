#This script generate same files , such as: caffe/proto/caffe.pb.h:

cd
cd caffe

protoc src/caffe/proto/caffe.proto --cpp_out=.
mkdir include/caffe/proto
mv src/caffe/proto/caffe.pb.h include/caffe/proto


#To generate the caffe librarys
cd ~/caffe
make distribute

#If the program not find caffe librarys, execute the commands below:
sudo ln ~/caffe/build/lib/libcaffe.a /usr/lib
sudo ln ~/caffe/build/lib/libcaffe.so /usr/lib
sudo ln ~/caffe/build/lib/libcaffe.so.1.0.0 /usr/lib
