#!/bin/bash

LOGFILE=downtimes.log
CSV_HEADERS="date,checked_servers,cmd,status"

if [ ! -f "$LOGFILE" ]; then
  touch "$LOGFILE"
  echo -e "$CSV_HEADERS\n" >> "$LOGFILE"
fi

servers=('taobao.com' 'google.com' 'facebook.com' 'yahoo.com' 'amazon.de' '8.8.8.8' '1.1.1.1')

for server in "${servers[@]}"; do
  ping -c 1 $server;
  if [[ "$?" == "0" ]]; then
    echo "Internet Connection is available: $server is accessible";
    exit 0;
  else
    echo "$server not accesible";
  fi
done

echo "Internet Connection down, none of (${servers[*]}) are accessible"
echo -e "$(date), ${servers[*]}, ping -c 1, DOWN\n" >> "$LOGFILE"

exit 1
