#!/bin/sh

echo "**********************************";
echo "** skip.sh STARTING ...         **";
echo "**********************************";

choice=1;
startdir=/mnt/2tb_USB_hard_disc/p_music;
functdir=/mnt/2tb_USB_hard_disc/scanpi/shellplayer;
queuedir=$functdir/queue;
playeddir=$functdir/played;

# e.g.
# pi@raspberrypi ~ $ ps -ef | grep mpg123
# pi       13359 13046  5 14:40 pts/0    00:00:01 mpg123 /mnt/2tb_USB_hard_disc/p_music/Various Artists/The Annual 2000/20 On the Beach [CRW Mix].mp3
# pi       13382 13371  1 14:40 pts/1    00:00:00 grep --color=auto mpg123
# pi@raspberrypi ~ $ ps -ef | grep mpg123 | awk '{print $2}'
# 13359
# 13382
# pi@raspberrypi ~ $ kill 13359

processtokill=`ps -ef | grep mpg123 | awk '{print $2}' | head -n 1`;
echo "**********************************";
echo "* Found Process ... killing $processtokill *";
echo "**********************************";

# or volume down, kill, volume up ??
kill -stop $processtokill;
echo -n "PAUSED... ";
kill $processtokill;
echo -n "KILLED... ";
kill -cont $processtokill;
echo "STARTED TO DEATH.";
echo "**********************************";
echo "* Item Skipped.                  *";
echo "**********************************";
