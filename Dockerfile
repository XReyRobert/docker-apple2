FROM xavierrrr/xrrzero:raspbian_stretch

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

RUN sudo apt-get update
RUN sudo apt-get -y --no-install-recommends install git libzip-dev libsdl1.2-dev libsdl-image1.2-dev libcurl4-openssl-dev zlib1g-dev
RUN sudo apt-get -y --no-install-recommends install make g++

RUN sudo apt-get -y --no-install-recommends install libraspberrypi-bin
#RUN sudo apt-get -y --no-install-recommends install xvfb

RUN git clone https://github.com/linappleii/linapple.git;cd linapple;make
RUN cd linapple;make install


RUN rm -fr linapple

RUN apt-get remove -y make git g++

RUN apt-get clean
RUN apt-get autoremove -y --purge 

COPY linapple.conf /etc/xdg/linapple/linapple.conf
COPY lin.sh /usr/local/bin/lin.sh
RUN chmod +x /usr/local/bin/lin.sh

ENV DISPLAY :14

ENTRYPOINT /usr/local/bin/lin.sh
