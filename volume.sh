#!/bin/sh

echo "**********************************";
echo "** volume.sh STARTING ...       **";
echo "**********************************";

choice=1;
startdir=/mnt/2tb_USB_hard_disc/p_music;
functdir=/mnt/scanpi/shellplayer;
queuedir=$functdir/queue;
playeddir=$functdir/played;

while [ $choice -ne 0 ]
do
   echo "**********************************";
   echo "* enter '+' or '-' to adjust vol *";
   echo "**********************************";

   if test $# -lt 1
   then read adjustment
   else
      echo "adjustment chosen by param:" $1
      adjustment="$1"
   fi


   if ["$adjustment" -eq "+"]
   then
      echo "**********************************";
      echo "* Increasing volume by 5\%...      *";
      echo "**********************************";
      `sudo amixer set PCM -- $[$(amixer get PCM|grep -o [0-9]*%|sed 's/%//')+5]%`
   else
      echo "**********************************";
      echo "* Decreasing volume by 5\%...      *";
      echo "**********************************";
      `sudo amixer set PCM -- $[$(amixer get PCM|grep -o [0-9]*%|sed 's/%//')-5]%`
   fi

   if test $# -lt 1
   then
      echo "**********************************";
      echo "* Adjust again? 1=yes, 0=no .    *";
      echo "**********************************";
      read choice;
   else
      echo "**********************************";
      echo "* chosen by param...             *";
      echo "**********************************";
      choice=0;
   fi
done

