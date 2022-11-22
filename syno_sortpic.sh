#!/bin/bash\
BASE_DIR=/volume1/photo/myuploadedpicrep\\'s\\ iPhone/From\\ DSPhoto\
ARCHIVE_DIR=/volume1/photo/myidestpicrep\'s\\ iPhone/Archives\
#Sort Pics\
find "$BASE_DIR" -type f \\( -iname "*.jpg" -o -iname "*.png" \\) | while IFS= read -r file; do\
year="$(date -d "$(stat -c %y "$file")" +%Y)"\
month="$(date -d "$(stat -c %y "$file")" +%b)"\
[[ ! -d "$ARCHIVE_DIR/$year/$month/Photos" ]] && mkdir -p "$ARCHIVE_DIR/$year/$month/Photos";\
mv "$file" "$ARCHIVE_DIR/$year/$month/Photos"\
done\
#Sort Video\
find "$BASE_DIR" -type f \\(  -iname "*.mov" -o -iname "*.mp*" \\) | while IFS= read -r file; do\
year="$(date -d "$(stat -c %y "$file")" +%Y)"\
month="$(date -d "$(stat -c %y "$file")" +%b)"\
[[ ! -d "$ARCHIVE_DIR/$year/$month/Videos" ]] && mkdir -p "$ARCHIVE_DIR/$year/$month/Videos";\
mv "$file" "$ARCHIVE_DIR/$year/$month/Videos"\
done\
#Set User right\
chown -R "myuser:users" "$ARCHIVE_DIR"}
