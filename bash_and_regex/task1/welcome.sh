#!/bin/bash
export LC_ALL=C

nickname="$1"

if [ -z "$nickname" ];
then
  echo "Invalid nickname" >&2
  exit 1
fi

length=${#nickname}

if [ "$length" -ge 3 ] && [ "$length" -le 16 ];
then
  if [[ "$nickname" =~ ^[A-Za-z0-9_]$ ]];
  then
    echo "Welcome, ${nickname}!"
    exit 0
  fi
fi

echo "Invalid nickname" >&2
exit 1
