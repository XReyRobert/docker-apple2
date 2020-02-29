* Build

docker build . -t docker-linapple


* Run

docker run -e DISPLAY=<yourip>:0.0 -ti --entrypoint /bin/sh  linapple



* Solution 1: X11 local setup (mac)

install XQuartz.
XQuartz->Preferences->Security->Allow Connections from network client
xhost + <yourip>

* Solution 2: Using XPra

docker run -d  --name x11-bridge  -e MODE="tcp"  -e XPRA_HTML="yes"  -e DISPLAY=:14  -e XPRA_PASSWORD=111  -p 10000:10000 jare/x11-bridge
docker run -d -e DISPLAY=:14 --volumes-from x11-bridge linapplenew 
