#!/bin/bash

# Option flag parsing using bash's getopts function
while getopts ":u:o:n:" option; do
    case "${option}" in
        u) u=${OPTARG} ;;       # enables "-u" flag for specifying username
        n) n=${OPTARG} ;;       # enables "-n" flag for specifying new password
    esac
done

# Reads IPs from ip_list.txt and enters user and new pass specified by -u and -n option arguments
# Note: Current password must be entered manually for every target machine in ip_list.txt
for ip in $(cat ip_list.txt); do
echo -e "Server IP is: $ip"
ssh root@$ip 'echo '${n}' | passwd --stdin '${u}''

done
