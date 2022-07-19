#!/bin/sh

DATA_SOURCE='https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt'

echo "Start ipset CNIP building..."
ipset destroy CNIP > /dev/null 2>&1
ipset create CNIP hash:net
for ip in $(curl -s $DATA_SOURCE | awk -F '|' '{print $1}'); do
    ipset add CNIP $ip
done
ipset save CNIP > /jffs/CNIP.ipset
echo "Build ipset CNIP finished."
