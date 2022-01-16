#!/bin/sh

echo "**********************************";
echo "** kontrol.sh STARTING ...      **";
echo "**********************************";

exit=1;
random=0;
startdir=/mnt/2tb_USB_hard_disc/p_music;
functdir=/mnt/scanpi/shellplayer;
queuedir=$functdir/queue;
playeddir=$functdir/played;


while [ "$exit" -ne "0" ]
do
   clear;
   
   if [ "$random" -eq "0" ]
   then
      echo "  /--------------------------------------------------\\ ";
      echo " /                                                    \\";
      echo " |         /SSSS /CCC\\  /A\\  N\\ |N PPPP\\ IIIII        |";
      echo " |         S|    C| |C /A A\\ NN\\|N P| |P  |I          |";
      echo " |         \\SSS\\ C|    AAAAA N\\N\\N PPPP/  |I          |";
      echo " |            |S C| |C A| |A N|\\NN P|     |I          |";
      echo " \\         SSSS/ \\CCC/ A| |A N| \\N P|    IIIII        /";
      echo "  \\__________________________________________________/ ";
   fi

   if [ "$random" -eq "1" ]
   then
      echo "  /--------------------------------------------------\\ ";
      echo " /       _____  _____          _   _ _____ _____      \\";
      echo " |      / ____|/ ____|   /\\   | \\ | |  __ \\_   _|     |";
      echo " |     | (___ | |       /  \\  |  \\| | |__) || |       |";
      echo " |      \___ \\| |      / /\\ \\ | .   |  ___/ | |       |";
      echo " |      ____) | |____ / ____ \\| |\\  | |    _| |_      |";
      echo " \\     |_____/ \\_____/_/    \\_\\_| \\_|_|   |_____|     /";
      echo "  \\__________________________________________________/ ";
   fi

   if [ "$random" -eq "2" ]
   then
      echo "  /--------------------------------------------------\\ ";
      echo " /     #####   #####    ###   ##    # ######  ###     \\";
      echo " |    #       #     #  #   #  # #   # #     #  #      |";
      echo " |     #####  #       ####### #  #  # ######   #      |";
      echo " |          # #       #     # #   # # #        #      |";
      echo " |    #     # #     # #     # #    ## #        #      |";
      echo " \\     #####   #####  #     # #     # #       ###     /";
      echo "  \\__________________________________________________/ ";
   fi

   random=`expr $random + 1`;
   if [ "$random" -eq "3" ] 
   then
      random=0;
   fi

   echo "  /         |            |            |              \\";
   echo " | 1 for Go | 0 for Stop | 2 for sKip | 3 for Whatson |";
   echo "  \\_________|_4 for Exit_|____________|______________/";

   read choice

   if [ "x$choice" = "x" ]
   then
      echo "nothing entered ... doing nothing!";
   else 
      if [ "$choice" = "4" -o "$choice" = "E" -o "$choice" = "e" ]
      then
         echo "$choice entered ... exiting kontrol!";
         exit=0;
      elif [ "$choice" = "0" -o "$choice" = "S" -o "$choice" = "s" ]
      then
         echo "$choice entered ... stopping!";
         processtokill=`ps -e | grep mpg123 | awk '{print $1}' | head -n 1`;
         echo "processtokill = $processtokill";
         if [ "x$processtokill" != "x" ]
         then
            $functdir/exit.sh;
         fi
      elif [ "$choice" = "1" -o "$choice" = "G" -o "$choice" = "g" ]
      then
         echo "$choice entered ... going!";
         processtokill=`ps -e | grep mpg123 | awk '{print $1}' | head -n 1`;
         echo "processtokill = $processtokill";
         if [ "x$processtokill" = "x" ]
         then
            $functdir/go.sh;
         fi
      elif [ "$choice" = "2" -o "$choice" = "K" -o "$choice" = "k" ]
      then
         echo "$choice entered ... skipping!";
         $functdir/skip.sh;
      elif [ "$choice" = "3" -o "$choice" = "W" -o "$choice" = "w" ]
      then
         echo "$choice entered ... showing whats on!";
         $functdir/whatson.sh 0;
      fi
   fi

   echo "**********************************";
   echo "* kontrol command done ...       *";
   echo "**********************************";
   sleep 4;

done
