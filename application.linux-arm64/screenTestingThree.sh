!/bin/sh

APPDIR=$(readlink -f "$0")
APPDIR=$(dirname "$APPDIR")
$APPDIR/java/bin/java -Djna.nosys=true -Djava.ext.dirs="$APPDIR/java/lib/ext" -Djava.library.path="$APPDIR:$APPDIR/lib" -cp "$APPDIR:$APPDIR/lib/screenTestingThree.jar:$APPDIR/lib/core.jar:$APPDIR/lib/jogl-all.jar:$APPDIR/lib/gluegen-rt.jar:$APPDIR/lib/jogl-all-natives-linux-aarch64.jar:$APPDIR/lib/gluegen-rt-natives-linux-aarch64.jar" screenTestingThree "$@"
