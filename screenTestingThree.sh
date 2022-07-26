!/bin/sh

APPDIR=$(readlink -f "$0")
APPDIR=$(dirname "$APPDIR")
$APPDIR/java/bin/java -Djna.nosys=true -Djava.ext.dirs="$APPDIR/java/lib/ext" -Djava.library.path="$APPDIR:$APPDIR/lib" -cp "$APPDIR:$APPDIR/lib/screenTestingThree.jar:$APPDIR/lib/core.jar:$APPDIR/lib/jogl-all.jar:$APPDIR/lib/gluegen-rt.jar:$APPDIR/lib/jogl-all-natives-linux-aarch64.jar:$APPDIR/lib/gluegen-rt-natives-linux-aarch64.jar" screenTestingThree "$@"


sleep 5
xterm -geometry 30x10+0-0 -e 'sensorBoard="ttyTHS2" && stty -F /dev/$sensorBoard 115200 && cat /dev/$sensorBoard' &

sleep 1
gst-launch-1.0 nvarguscamerasrc sensor_id=0 ! 'video/x-raw(memory:NVMM), width=1280, height=720, framerate=30/1' ! nvvidconv flip-method=2 ! videoscale ! 'video/x-raw(memory:NVMM)', width=200, height=200 ! nvvidconv ! xvimagesink
