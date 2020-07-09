FROM ubuntu:18.04

# Basic tools
RUN apt-get update && apt-get -y upgrade && apt-get install -yq build-essential software-properties-common python-pip apt-utils git
 
# Install melodic
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt install -y ros-melodic-desktop-full

RUN apt-get install -y python-rosdep
RUN rosdep init
RUN rosdep update
RUN apt-get install -y ros-melodic-can-msgs ros-melodic-jsk-rviz-plugins libboost-all-dev ros-melodic-rosserial ros-melodic-rosserial-arduino libpcap0.8-dev liblapack-dev libarmadillo-dev ros-melodic-velodyne ros-melodic-geometry2 ros-melodic-rqt-multiplot ros-melodic-tf2-sensor-msgs ros-melodic-robot-localization libqwt-dev
