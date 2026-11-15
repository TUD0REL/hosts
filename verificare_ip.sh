#!/bin/bash
grep -v '^#' /etc/hosts | while read ip host rest; do
    [ -n "$host" ] && nslookup "$host" 8.8.8.8 | grep -q "$ip" || echo "Bogus IP: $host"
done
