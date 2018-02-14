#!/bin/sh
movie="movie"
tvshow="tvshow"
music="music"
nick="nick"
ben="ben"
name="$1"
base_path="$2"
label="$3"
synctvshows_path="/home21/oky64q12nosq5uz/downloads/tv/completed/"
syncmovies_path="/home21/oky64q12nosq5uz/downloads/movies/completed/"
syncmusic_path="/home21/oky64q12nosq5uz/downloads/music/completed/"
ben_path="/home21/oky64q12nosq5uz/downloads/nick/completed/"
nick_path="/home21/oky64q12nosq5uz/downloads/ben/completed/"
base_name="$(basename "$0")"
lock_file="/home21/oky64q12nosq5uz/tmp/$base_name.lock"
trap "rm -f $lock_file exit 0" SIGINT SIGTERM
echo "Download started $(date) $line $3 $name" >> /home21/oky64q12nosq5uz/logs/hardlinkdownloads.log
while [ -e "$lock_file" ]
do
    echo "Sync in progress waiting 200 seconds $(date) $line" >> /home21/oky64q12nosq5uz/logs/hardlinkdownloads.log
    sleep 200
done
touch "$lock_file"
if [[ "$label" == "$movie" ]]; then
        cp -val "$base_path" "syncmovies_path"
        echo "Created a hardlink of $name in LFTP sync folder" >> /home21/oky64q12nosq5uz/logs/movies/hardlinkdownloads.log
        echo "$base_path" >> /home21/oky64q12nosq5uz/logs/movies/hardlinkdownloads.log
        bash "/home21/oky64q12nosq5uz/scripts/syncdownload.sh" "$movie"
elif [[ "$label" == "$tvshow" ]]; then
        cp -val "$base_path" "$synctvshows_path"
        echo "Created a hardlink of $name in LFTP sync folder" >> /home21/oky64q12nosq5uz/logs/tv/hardlinkdownloads.log
        echo "$base_path" >> /home21/oky64q12nosq5uz/logs/tv/hardlinkdownloads.log
        bash "/home21/oky64q12nosq5uz/scripts/syncdownload.sh" "$tvshow"
elif [[ "$label" == "$music" ]]; then
        cp -val "$base_path" "$syncmusic_path"
        echo "Created a hardlink of $name in LFTP sync folder" >> /home21/oky64q12nosq5uz/logs/tv/hardlinkdownloads.log
        echo "$base_path" >> /home21/oky64q12nosq5uz/logs/tv/hardlinkdownloads.log
        bash "/home21/oky64q12nosq5uz/scripts/syncdownload.sh" "$music"
elif [[ "$label" == "$ben" ]]; then
        cp -val "$base_path" "$ben_path"
        echo "Created a hardlink of $name in LFTP sync folder" >> /home21/oky64q12nosq5uz/logs/ben/hardlinkdownloads.log
        echo "$base_path" >> /home21/oky64q12nosq5uz/logs/ben/hardlinkdownloads.log
elif [[ "$label" == "$nick" ]]; then
        cp -val "$base_path" "$nick_path_path"
        echo "Created a hardlink of $name in LFTP sync folder" >> /home21/oky64q12nosq5uz/logs/nick/hardlinkdownloads.log
        echo "$base_path" >> /home21/oky64q12nosq5uz/logs/nick/hardlinkdownloads.log
else
        echo "label name in error" >> /home21/oky64q12nosq5uz/logs/hardlinkdownloads.log
fi
rm -f "$lock_file"
trap - SIGINT SIGTERM
exit 0
