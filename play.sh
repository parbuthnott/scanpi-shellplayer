#!/bin/sh

echo "**********************************";
echo "** play.sh STARTING ...         **";
echo "**********************************";

choice=1;
startdir=/mnt/2tb_USB_hard_disc/p_music;
functdir=/mnt/scanpi/shellplayer;
queuedir=$functdir/queue;
playeddir=$functdir/played;

while [ $choice -ne 0 ]
do

	if stat --printf='' $queuedir/* 2>/dev/null
	then
		echo "**********************************";
		echo "* Files exist in queue...        *";
		echo "**********************************";
	else
		echo "**********************************";
		echo "* No files exist in queue...     *";
		echo "**********************************";

		# if no file to play, queue something random?, set it = to nextinqueue
		# filelines=`wc -l allmusic.txt|awk '{print $1}'`;
		# echo "filelines:$filelines:";
		# echo $((RANDOM % $filelines));
		# linetoread=`echo -n $((RANDOM % $filelines))`;
		# linetoread=`echo -n $((RANDOM % $filelines))`
		# echo "linetoread: $linetoread";
		# filetoqueue=`sed -n "{linetoread}p" allmusic.txt`;

		# catch the offchance that there is no index file...
		if [ -s $functdir/allmusicrandom.txt ]
		then 
			echo "**********************************";
			echo "* allmusicrandom.txt exists...   *";
			echo "**********************************";
		else
			echo "**********************************";
			echo "* No allmusicrandom.txt.         *";
			echo "**********************************";
			echo "* Calling reindex process...     *";
			echo "**********************************";
			$functdir/reindex.sh;
		fi

		# read first line into variables...
		echo "**********************************";
		echo "* Reading next random item...    *";
		echo "**********************************";
		filetoqueue=`head -n 1 $functdir/allmusicrandom.txt`;

		# remove first line...
		echo "**********************************";
		echo "* Removing next random item...   *";
		echo "**********************************";
		mv $functdir/allmusicrandom.txt $functdir/allmusicrandom.sed;
		sed '1d' $functdir/allmusicrandom.sed > $functdir/allmusicrandom.txt;
		rm $functdir/allmusicrandom.sed;

		# all ready to queue...
		echo "**********************************";
		echo "* Adding item to queue...        *";
		echo "**********************************";
		$functdir/queue.sh "$filetoqueue";

	fi

	echo "**********************************";
	echo "* Finding next file in queue...  *";
	echo "**********************************";
	nextinqueue=`find "$queuedir" -type f | sort | head -1`
	echo $nextinqueue

	echo "**********************************";
	echo "* Examining next file in queue...*";
	echo "**********************************";
	filetoplay=`cat $nextinqueue`
	echo "$filetoplay"

	echo "**********************************";
	echo "* Moving item to played...       *";
	echo "**********************************";
	mv "$nextinqueue" "$playeddir"; 
	echo "**********************************";
	echo "* Calling MPG123 to play file... *";
	echo "**********************************";
	mpg123 "$filetoplay"

	if test $# -lt 1
	then
		echo "**********************************";
		echo "* Play another? 1=yes, 0=no.     *";
		echo "**********************************";
		read choice;
	else
		echo "**********************************";
		echo "* Multiplay mode...              *";
		echo "**********************************";
	fi
done
