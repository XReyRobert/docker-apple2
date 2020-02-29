* Build

docker build . -t docker-linapple

* X11 local setup (mac)

install XQuartz.
XQuartz->Preferences->Security->Allow Connections from network client
xhost + <yourip>

* Run

docker run -e DISPLAY=<yourip>:0.0 -ti --entrypoint /bin/sh  linapplenew




