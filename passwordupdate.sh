#!/bin/bash

# Option flag parsing using bash's getopts function
while getopts ":u:o:n:" option; do
    case "${option}" in
        u) u=${OPTARG} ;;       # enables "-u" flag for specifying username
        o) o=${OPTARG} ;;       # enables "-o" flag for specifying old password
        n) n=${OPTARG} ;;       # enables "-n" flag for specifying new password
    esac
done

# Reads ip_list.txt and iterates passwd with user and password option arguments
for ip in $(cat ip_list.txt); do
echo $ip;
ssh ${u}@$ip 'passwd <<EOF
${o}
${n}
${n}
EOF';

done
