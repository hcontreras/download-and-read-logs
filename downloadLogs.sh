#!/bin/bash
# author: humberto.o.contreras@gmail.com
date=$(date -d 'now - 1 day' +%Y-%m-%d)
#Setting log file name
filename="$date.log"
# Downloading log file from server 001
scp -P 2121  -i ~/.ssh/id_rsa user@XXX.XXX.XXX.001:/path/to/log/file/$filename .
# Downloading log file from server 002
com="ssh -p 2121 user@XXX.XXX.XXX.002 'cat /path/to/log/file/$filename' >> /my/local/log/file/$filename"
eval $com
# Processing unique local log data
awk="awk -f data.awk $filename"
$awk
