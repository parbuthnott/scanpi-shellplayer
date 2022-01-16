#!/bin/sh

echo "**********************************";
echo "** move.sh STARTING ...         **";
echo "**********************************";

startdir=/mnt/2tb_USB_hard_disc/p_music;
sharedir=/mnt/scanpi/sharer/shared/;

echo "**********************************";
echo "* Finding and indexing...        *";
echo "**********************************";
cp -r "$sharedir" "$startdir";

echo "**********************************";
echo "* Created allmusicrandom.txt     *";
echo "**********************************";
