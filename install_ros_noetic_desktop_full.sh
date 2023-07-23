#!/bin/sh

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Set up keys
sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
# Installation
sudo apt update
sudo apt install ros-noetic-desktop-full
# Environment setup
SHELL_NAME=$(ps -p $$ | grep sh | awk '{ print $4 }')
if [ $SHELL_NAME="bash" ]; then
    source /opt/ros/noetic/setup.bash
else
    source /opt/ros/noetic/setup.zsh
fi
# Dependencies for building packages
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential python3-osrf-pycommon python3-catkin-tools
sudo rosdep init
rosdep update

