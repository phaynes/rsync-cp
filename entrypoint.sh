#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

# Setup a cron schedule
echo "* * * * * /etc/run.sh >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > /var/scheduler.txt

source /var/host-paths.txt
source /var/file-paths.txt
export SOURCE_HOST SOURCE_PATH LOCAL_PATH

mkdir -p /root/out
mkdir -p /root/in

# Ensure we don't have key setup issues.
ssh -o "StrictHostKeyChecking no" $SOURCE_HOST :

crontab /var/scheduler.txt
cron -f
