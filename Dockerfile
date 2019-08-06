FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

RUN apt-get update
RUN apt install software-properties-common -y
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main" -y

RUN apt update
#RUN apt install nano 
#build-essential cmake git unzip pkg-config libjasper-dev libpng-dev \
        #libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev \ 
        #libgtk-3-dev libhdf5-serial-dev graphviz libopenblas-dev libatlas-base-dev gfortran wget \
        #python3-dev python3-pip g++ make -y

#RUN apt install numpy

COPY ./darknet /build

WORKDIR /build
RUN make

#RUN touch build/darknet/x64/Release/data/train.txt

RUN ./darknet detector train data/obj.data yolo-obj.cfg darknet53.conv.74
