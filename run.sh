#!/bin/bash
source /var/host-paths.txt
source /var/file-paths.txt
export SOURCE_HOST SOURCE_PATH LOCAL_PATH
source /var/cmd.txt
export CMD
`$CMD`
