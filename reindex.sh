#!/bin/sh

echo "**********************************";
echo "** reindex.sh STARTING ...      **";
echo "**********************************";

choice=1;
startdir=/mnt/2tb_USB_hard_disc;
functdir=/mnt/2tb_USB_hard_disc/scanpi/shellplayer;
queuedir=$functdir/queue;
playeddir=$functdir/played;

echo "**********************************";
echo "* Finding and indexing...        *";
echo "**********************************";
find "$startdir" -type f -name *.mp3 > $functdir/allmusic.txt;

echo "**********************************";
echo "* Created allmusic.txt           *";
echo "**********************************";
echo "* Randomizing...                 *";
echo "**********************************";
sort -R $functdir/allmusic.txt > $functdir/allmusicrandom.txt;

echo "**********************************";
echo "* Created allmusicrandom.txt     *";
echo "**********************************";
