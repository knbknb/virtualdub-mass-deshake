#!/bin/bash
# Control file for
# mass-deshaking videos with the freeware VirtualDub.
# VirtualDub will attempt to process all files in an entire directory.You specify on the command line.


# the call looks like this:
#. ./deshake-all.sh ../wakeboard-test bright128


# output wiöö then look like this
#/home/knut/Videos/wakeboard-test
#Videos\\wakeboard-test
#C:\\\\users\\knut\\My Documents\\Videos
#
#--------------------------------------------------------------------------------
#Deshaked Files will be copied from
#/home/knut/Videos/wakeboard-test
# to:
#/home/knut/Videos/wakeboard-test-bright128
#Windows DirName: C:\\\\users\\knut\\My Documents\\Videos\\wakeboard-test-bright128
#--------------------------------------------------------------------------------

# Requirements:
#  - wine 1.x
#  - Virtualdub > 1.6
#  - Deshaker Plugin installed
#  - Virtualdub.exe must be on the wine Path
# there needs to be a .vdscript file present with the filter settings saved properly.

# this shellscript runs on Ubuntu Linux with Virtualdub installed under wine.
if [ $# -lt 1 ]; then
 echo "call: $0 dirname"
 echo "Exactly one command line arg is required."
 exit 1
fi

FFMPEG=/usr/bin/avconv
indir=$(readlink -m $1)
echo $indir
shift
suf=$1

if [[ "$suf" == "" ]]; then
	date=$(date "+%Y-%m-%d")
	suf="deshaked-$date"
fi
basedir=$(basename  $indir)
parentdir_abs=$(dirname $indir)
parentdir=$(basename $parentdir_abs)
windir='C:\\\\users\\knut\\My Documents'
windir="$windir\\\\$parentdir"
echo "$parentdir\\\\$basedir"
echo $windir
out="$suf"

mkdir -p "$parentdir_abs//$basedir-$out"
windir_out="$windir\\\\$basedir-$out"
echo
echo $(perl -E 'say "-" x 80')
echo "Deshaked Files will be copied from"
echo "$indir"
echo " to:"
echo  "$parentdir_abs/$basedir-$out"
echo "Windows DirName: ${windir_out}"
echo $(perl -E 'say "-" x 80')
echo

for f in $(ls -1 $indir/*);do

   infile="$f"
   echo "infile: $infile"
   fbase=$(basename $f)
	# Get duration and fps
	duration=$($FFMPEG -i $infile 2>&1 | sed -n "s/.* Duration: \([^,]*\), start: .*/\1/p")
	fps=$($FFMPEG -i $infile 2>&1 | sed -n "s/.*, \(.*\) tb.*/\1/p")

	hours=$(echo $duration | cut -d":" -f1)
	minutes=$(echo $duration | cut -d":" -f2)
	seconds=$(echo $duration | cut -d":" -f3)

	#these values may be parsed to NULL, so assign 0 to make sure bc can work
	if [[ "$hours" -eq "" ]];then
		hours=0
	fi
	if [[ "$minutes" -eq "" ]];then
		minutes=0
	fi
	if [[ "$seconds" == "" ]];then
		seconds=0
	fi


	numframes=$( echo "($hours*3600+$minutes*60+$seconds)*$fps + 1"| bc -q | cut -d"." -f1)
   echo "frames: $numframes  in '$f'"

   #echo /home/knut/bin/runvirtualdub.sh "$numframes" "$windir\\$basedir\\\\$fbase" "${windir_out}\\\\$fbase"
    wine VirtualDub.exe /x /i deshake-pass1-pass2--sharpen-brighten.vdscript "$numframes" "$windir\\$basedir\\\\$fbase" "${windir_out}\\\\$fbase"

done
