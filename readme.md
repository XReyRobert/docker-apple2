* Build

docker build . -t docker-linapple

* Run

export disk1="https://mirrors.apple2.org.za/ftp.apple.asimov.net/images/games/action/pac_man/ms_pacman.dsk"

docker run -d -e DISPLAY=<yourip>:0.0 e disk1=$disk1 -ti --entrypoint /bin/sh  linapple

* Solution 1: X11 local setup (mac)

install XQuartz.
XQuartz->Preferences->Security->Allow Connections from network client
xhost + <yourip>

* Solution 2: Using XPra

docker run -d  --name x11-bridge  -e MODE="tcp"  -e XPRA_HTML="yes"  -e DISPLAY=:14  -e XPRA_PASSWORD=111  -p 10000:10000 jare/x11-bridge

export disk1="https://mirrors.apple2.org.za/ftp.apple.asimov.net/images/games/action/pac_man/ms_pacman.dsk"

docker run -d -e DISPLAY=:14 -e disk1=$disk1 --volumes-from x11-bridge linapple

then direct your browser to localhost:10000
