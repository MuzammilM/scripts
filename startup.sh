#!/bin/bash
export ac_LIFE=$(($LIFE - 5))
/usr/bin/curl -s --location --request POST "https://api.telegram.org/bot"$BOT_TOKEN"/sendMessage" --header "Content-Type: application/json" --data "@/tmp/tg_create_5.json"
