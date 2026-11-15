#!/bin/bash
verifica() { nslookup "$1" "$3" | grep -q "$2" || echo "Bogus IP: $1"; }
grep -v '^#' /etc/hosts | while read ip host rest; do
    [ -n "$host" ] && verifica "$host" "$ip" "8.8.8.8"
done
