#!/bin/sh

echo "**********************************";
echo "** go.sh STARTING ...           **";
echo "**********************************";

startdir=/mnt/2tb_USB_hard_disc/p_music;
functdir=/mnt/scanpi/shellplayer;
queuedir=$functdir/queue;
playeddir=$functdir/played;

# nohup ./p 1 > gohup.out &
nohup $functdir/play.sh 1 > /home/pi/gohup.out &

echo "**********************************";
echo "** nohup'd the play process ... **";
echo "**********************************";
