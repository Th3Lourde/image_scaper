#!/bin/bash

# The first argument is the number of images that should be downloaded
# The second argument is the name of the image that should be searched for.


if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    have_args=0
  else
    echo "Downloading: $1 images of $2"
    have_args=1
fi

## Template Command
# googleimagesdownload -k "baseball game" -s medium -wr '{"time_min":"09/01/2018","time_max":"09/30/2018"}' -l 500 -o fastai/courses/dl1/data/baseballcricket -i train/baseball -cd ~/chromedriver

## Command that works for me:
# googleimagesdownload -k "rugby" -l 500 -o ~/Documents/AI/fast.ai/course-v3/nbs/my_files/rugby -cd /usr/lib/chromium-browser/libs/chromedriver



increment_date()
{
  # Month
  if [$1 == 12]
    then
      MONTH=1
      YEAR=YEAR-1
    else
      MONTH=MONTH+1
      YEAR=YEAR
  fi
}

## Path is the output path that the script will spit the images to :)
# PATH = ~/Documents/

if [ "$have_args" = "1" ]
# Issue the command until we have enough images
 then
   i=0
   DAY=$(date +'%d')
   MONTH=$(date +'%m')
   YEAR=$(date +'%Y')

   while [ $i -le $1 ]
   do
     ## Testing
     # echo "i = $i"
     # $(googleimagesdownload -k $2 -s medium -wr {'time_min':'$MONTH/01/$YEAR','time_max':'$MONTH/28/$YEAR'} -l 500 -o ~/Documents/AI/fast.ai/course-v3/nbs/my_files  -i /ruby -cd ~/chromedriver)
     # $(googleimagesdownload -k $2 -s medium -l 500 -o ~/Documents/AI/fast.ai/course-v3/nbs/my_files -i rugby -cd ~/chromedriver)
     # $(googleimagesdownload -k "rugby" -l 500 -o ~/Documents/AI/fast.ai/course-v3/nbs/my_files/rugby -cd ~/chromedriver)
     # $(googleimagesdownload -k "rugby" -l 500  -cd ~/chromedriver)

     ## Got shell command working on terminal:
     # Make sure that
     $(googleimagesdownload -k "$2" -s medium -wr '{"time_min":"$MONTH/01/$YEAR","time_max":"$MONTH/28/$YEAR"}' -l 500 -o ~/Documents/AI/fast.ai/course-v3/nbs/my_files/Data  -i /rugby -cd /usr/lib/chromium-browser/libs/chromedriver)


     i=$(($i+500))
   done
fi

