#!/bin/sh

echo "**********************************";
echo "** track.sh STARTING ...        **";
echo "**********************************";

choice=1;
startdir=/mnt/2tb_USB_hard_disc/p_music;
functdir=/mnt/scanpi/shellplayer;
queuedir=$functdir/queue;
playeddir=$functdir/played;

while [ $choice -ne 0 ]
do
	ls "$startdir";
	echo "**********************************";
	echo "* enter band name                *";
	echo "**********************************";

	if test $# -lt 1
	then read band
	else
		echo "band chosen by param:" $1
		band=$1
	fi
	
	echo "**********************************";
	echo "* Thanks. Finding...             *";
	echo "**********************************";

	ls "$startdir/$band"; 
	echo "**********************************";
	echo "* enter album name               *";
	echo "**********************************";

	if test $# -lt 2
	then read album
	else
		echo "album chosen by param:" $2
		album=$2
	fi

	echo "**********************************";
	echo "* Thanks. Finding...             *";
	echo "**********************************";

	ls "$startdir/$band/$album";
	echo "**********************************";
	echo "* enter track name               *";
	echo "**********************************";

	if test $# -lt 3
	then read track
	else
		echo "track chosen by track:" $3
		track=$3
	fi

	echo "**********************************";
	echo "* Thanks. Finding and playing... *";
	echo "**********************************";

	find "$startdir/$band/$album/$track" -type f -name *.mp3 -exec $functdir/queue.sh '{}' \;

#	echo "**********************************";
#	echo "* band : $band NOT FOUND         *";
#	echo "**********************************";
#	echo "**********************************";
#	echo "* album : $album NOT FOUND       *";
#	echo "**********************************";
#	echo "**********************************";
#	echo "* track : $track NOT FOUND       *";
#	echo "**********************************";

	if test $# -lt 3
	then
		echo "**********************************";
		echo "* Queue another? 1=yes, 0=no.    *";
		echo "**********************************";
		read choice;
	else
		echo "**********************************";
		echo "* Single item to queue mode...   *";
		echo "**********************************";
		choice=0;
	fi
done

