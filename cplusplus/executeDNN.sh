#To test a DNN model trainned in DIGITS nvidia, you need inform the models like the example below.


#read -p "Type a name of image: " IMAGE
#IMAGE=/home/fei/Documents/isaac_Rhoban/testeCaffe/robot21.png
IMAGE1=./ball.png
IMAGE2=./noBall.png


./classifier \
  ./net/deploy.prototxt \
  ./net/snapshot_iter_7290.caffemodel \
  ./net/mean.binaryproto \
  ./net/labels.txt \
  ${IMAGE1} \
  ${IMAGE2}
