#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

# Setup a cron schedule
echo "* * * * * /etc/run.sh >> /var/log/cron.log 2>&1
* * * * * sleep 15; /etc/run.sh >> /var/log/cron.log 2>&1
* * * * * sleep 30; /etc/run.sh >> /var/log/cron.log 2>&1
* * * * * sleep 45; /etc/run.sh >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > /var/scheduler.txt

source /var/host-paths.txt
source /var/file-paths.txt
export SOURCE_HOST SOURCE_PATH LOCAL_PATH

mkdir -p /root/out
mkdir -p /root/in

# Ensure we don't have key setup issues.
up_node_file="/var/up_nodes.txt"
while IFS= read -r node_ip
do
  ssh -o "StrictHostKeyChecking no" root@$node_ip 'mkdir -p /root/out'
done < "$up_node_file"

# Ensure we don't have key setup issues.
down_node_file="/var/down_nodes.txt"
while IFS= read -r node_ip
do
  ssh -o "StrictHostKeyChecking no" root@$node_ip 'mkdir -p /root/in'
done < "$down_node_file"

chmod +x /etc/run.sh

crontab /var/scheduler.txt

cron -f
