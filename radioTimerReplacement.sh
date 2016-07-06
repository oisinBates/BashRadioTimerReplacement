#!/bin/bash
# run below command, prior to running this script, to avoid need for password insertion during script's lifecycle. 
#sudo chmod +s radioTimerReplacement.sh  

#regular expression to check that first parameter is an integer
regEx='^[0-9]+$' 
#Checks that second parameter is a number(allowing the option of up to two decimal places)
regExDecimals='^[0-9]+([.][0-9]{1,2})?$' 

#check that parameters match regular expressions. Print error and exit script if a parameter doesn't match.
if ! [[ $1 =~ $regEx ]] ; then
   echo "error @ parameter 1: Please enter a valid numberof minutes" >&2; exit 1
elif ! [[ $2 =~ $regExDecimals ]] ; then
   echo "error @ parameter 2: Please enter a valid number of hours with up to two decimal places optional" >&2; exit 1
fi

#the script's start time, formatted as a timestamp for insertion to DB
bedTime=`date +'%F %T'` 
#assigning easily-readable name to parameter one, for confusion-free integration later in the script
radioPlayLength=$1 
#convert second parameter from hours to seconds
sleepLength=$(bc <<< "scale=2;$2 * 60 * 60") 
#remove empty decimal places from $sleepLength
sleepLength=${sleepLength%.*} 

wakeTime=`date --date=$sleepLength' seconds' +'%s'` #unix time for rtcwake command
wakeTimeFormatted=`date --date @$wakeTime +%H::%M::%p` #formatted time for text-to-speech notification of wake-up time

echo wa-king up at $wakeTimeFormatted | festival --tts
echo waking up at $wakeTimeFormatted
#Open chrome to play radio, specifying nohup to avoid hangup signals from chrome
#sleep thread for $radioPlayLength in minutes
nohup google-chrome http://www.liveradio.ie/stations/rte-lyric-fm & sleep $radioPlayLength'm' 
#close browser to turn off radio
killall chrome 
#Suspend-to-RAM and wake up at $wakeTime
sudo rtcwake -l -m mem -t $wakeTime 

#clear any queued tracks from rhythmbox player
rhythmbox-client --clear-queue
#play alarm-clock soundbite 
rhythmbox-client --play-uri="file:///home/oisin/Videos/Ringing-clock.mp3"

musicFilepath=(/home/oisin/Music/*)
#get random directory musicFilepath withim the Music Folder
randAlbum=$(printf "%s\n" "${musicFilepath[RANDOM % ${#musicFilepath[@]}]}") 
#if this folder contains any subdirectories, ie the artist has more than one album, count will be greater than zero.
count=$(find "$randAlbum"/* -maxdepth 0 -type d | wc -l)

#check if folder contains sub-directories and choose a random subdirectory if this is the case
if [ $count > 0 ] ; then
  musicFilepath=("$randAlbum"/*)	
  randAlbum=$(printf "%s\n" "${musicFilepath[RANDOM % ${#musicFilepath[@]}]}")
fi

# iterate through each file in the album and queue the song to play
for ((i=0; i<${#randAlbum[@]}; i++)); do
    rhythmbox-client --enqueue "file://${randAlbum[$i]}"
    echo array@ "${randAlbum[$i]}"
done

#update DB
mysql -u root -p[mysqlPassword] -e "INSERT INTO bash_bedtime_data.bash_bedtime_data_logs(sleep_time,radio_play_length,sleep_length) VALUES(\"$bedTime\",\"$1\",\"$2\")"
#A MySQL event is scheduled to generate weekly averages, which are inserted to a seperate table of averages.
#As I'm running this locally and will not have a dedicated MySQL server always running, 
#it was necessary to alter etc/mysql/my.cnf to include 'event_scheduler=on'