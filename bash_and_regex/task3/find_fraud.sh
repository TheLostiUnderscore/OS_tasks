#!/bin/bash

LOG_FILE="$1"

awk '
{
  from = $1
  to = $3
  amount = $4
  item = $5

  balance[from] -= amount
  balance[to] += amount
}
END {
  for (player in balance){
    if (balance[player] < 0){
      print player
    }
  }
}

' "$LOG_FILE"
