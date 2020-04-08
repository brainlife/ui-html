FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

MAINTAINER Soichi Hayashis <hayashis@iu.edu>

EXPOSE 5900
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    vim mesa-utils tightvncserver xfce4 wget \
    git g++ python python-numpy libeigen3-dev zlib1g-dev libqt4-opengl-dev libgl1-mesa-dev libfftw3-dev libtiff5-dev

RUN apt-get install -y firefox xdotool

ADD virtualgl_2.5.2_amd64.deb /
RUN dpkg -i /virtualgl_2.5.2_amd64.deb

RUN apt-get remove -y xfce4-panel

# Copy VNC script that handles restarts
ADD startvnc.sh /
ADD xstartup /root/.vnc/xstartup
ENV USER=root X11VNC_PASSWORD=override


CMD ["/startvnc.sh"]

