#!/bin/bash
source /var/host-paths.txt
source /var/file-paths.txt
export SOURCE_HOST SOURCE_PATH LOCAL_PATH
echo rsync --remove-source-files -zarvh -e ssh $SOURCE_HOST:$SOURCE_PATH $LOCAL_PATH $2>>$1/var/log/r.log
rsync --remove-source-files -zarvh -e ssh $SOURCE_HOST:$SOURCE_PATH $LOCAL_PATH $2>>$1/var/log/r.log 
