#!/bin/sh

echo "**********************************";
echo "** whatson.sh STARTING ...      **";
echo "**********************************";

choice=1;
startdir=/mnt/2tb_USB_hard_disc/p_music;
functdir=/mnt/scanpi/shellplayer;
queuedir=$functdir/queue;
playeddir=$functdir/played;

while [ $choice -ne 0 ]
do

	if stat --printf='' $playeddir/* 2>/dev/null
	then
		echo "**********************************";
		echo "* Files exist in played...       *";
		echo "**********************************";

                # read last played into variables...
                echo "**********************************";
                echo "* Reading latest played item...  *";
                echo "**********************************";
                lastplayed=`ls -rt $playeddir | tail -n 1`;
		file="$playeddir/$lastplayed";
		sedreplace="s:$startdir/\(.*\)/\(.*\)/\(.*\)$:\1:";

		## command that *works*
		## sed -e 's:/mnt/2tb_USB_hard_disc/p_music/\(.*\)/\(.*\)/\(.*\)$:Artist=\1, Album=\2, Track=\3:' /mnt/scanpi/shellplayer/played/140622115448015234956
		## Artist=Loaded, Album=Sick, Track=08 - I See Through You.mp3

		artist=`sed -e $sedreplace $file`;

		sedreplace="s:$startdir/\(.*\)/\(.*\)/\(.*\)$:\2:";
		album=`sed -e $sedreplace $file`;

		sedreplace="s:$startdir/\(.*\)/\(.*\)/\(.*\)$:\3:";
		track=`sed -e $sedreplace $file`;

		echo "**********************************";
		echo "* now playing ...                *";
		echo "* ARTIST: $artist";
		echo "* ALBUM: $album";
		echo "* TRACK: $track";
		echo "**********************************";

	else
		echo "**********************************";
		echo "* No files exist in played...    *";
		echo "**********************************";
	fi

	if test $# -lt 1
	then
		echo "**********************************";
		echo "* Show another? 1=yes, 0=no.     *";
		echo "**********************************";
		read choice
	else
		echo "**********************************";
		echo "* Multiplay mode...              *";
		echo "**********************************";
		choice=$1
	fi
done
