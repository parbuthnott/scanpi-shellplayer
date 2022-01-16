#!/bin/sh

echo "**********************************";
echo "** covershow.sh STARTING ...    **";
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
      band="$1"
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
      album="$2"
   fi

   echo "**********************************";
   echo "* Thanks. Finding and showing... *";
   echo "**********************************";

   ls "$startdir/$band/$album/Folder.jpg";

   echo "**********************************";
   echo "* Found???...                    *";
   echo "**********************************";

   exec < /dev/tty0 > /dev/tty0
   LINES="`stty size`";
   LINES="${LINES% *}";
   printf "\e[2J\e[$(((LINES*8+15)/10));${LINES}r\e[?6h\e[H";

   width="`fbset -depth 32 -s`";
   width="${width#*\"}";
   width="${width%%x*}";

#   find "$startdir/$band/$album/" -type f -name Folder.jpg -exec $functdir/queue.sh '{}' \;
  
   convert "/mnt/scanpi/no_cover.jpg" -scale "${width}x" -depth 8 rgba:- > /dev/fb0
#   convert "$startdir/$band/$album/Folder.jpg" -scale "${width}x" -depth 8 rgba:- > /dev/fb0

   echo "**********************************";
   echo "* Converted???...                *";
   echo "**********************************";

   exit

   if test $# -lt 2
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

