#!/bin/bash

CONFIG_FILE="server.conf"
> "$CONFIG_FILE"

vars=("SERVER_NAME" "MAX_PLAYERS" "SPAWN_COORDS")

for var in "${vars[@]}";
do
  if [[ -z "${!var}" ]];
  then
    case "$var" in
      "SERVER_NAME") echo "SERVER_NAME=StarCraft" >> "$CONFIG_FILE";;
      "MAX_PLAYERS") echo "MAX_PLAYERS=125" >> "$CONFIG_FILE";;
      "SPAWN_COORDS") echo "SPAWN_COORDS=\"274 67 -249\"" >> "$CONFIG_FILE";;
    esac
  else
    if [[ "$var" == "SPAWN_COORDS" ]];
    then
      echo "SPAWN_COORDS=\"${!var}\"" >> "$CONFIG_FILE"
    else
      echo "$var=${!var}" >> "$CONFIG_FILE"
    fi
  fi
done

cat "$CONFIG_FILE"
