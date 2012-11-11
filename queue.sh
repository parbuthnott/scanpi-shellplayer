#!/bin/sh

echo "**********************************";
echo "** queue.sh STARTING ...        **";
echo "**********************************";

startdir=/mnt/2tb_USB_hard_disc/p_music;
functdir=/mnt/2tb_USB_hard_disc/scanpi/shellplayer;
queuedir=$functdir/queue;
playeddir=$functdir/played;

echo "**********************************";
echo "* enter whole track name         *";
echo "**********************************";

if test $# -lt 1
then read whole
else
	echo "whole chosen by param:" $1
	whole=$1
fi

echo "**********************************";
echo "* Thanks. Adding to queue...     *";
echo "**********************************";

timestamp=$(date +%m%d%y%H%M%S%N)
echo "$whole" > $queuedir/$timestamp

if [ -s $queuedir/$timestamp ]
then 
	echo "**********************************";
	echo "* Item Queued.                   *";
	echo "**********************************";
else
	echo "**********************************";
	echo "* No (or 0 length) item created? *";
	echo "**********************************";
	ls $queuedir/$timestamp
	cat $queuedir/$timestamp
fi
