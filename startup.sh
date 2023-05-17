#!/bin/sh
sleep 60s
echo "Waiting"
export ac_LIFE=$(($LIFE - 5))
curl -s --location --request POST 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' --header 'Content-Type: application/json' --data-raw '{"text": "Server Created","chat_id": "'$chat_id'"}'
