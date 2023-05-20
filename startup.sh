#!/bin/bash
echo "curl --location --request POST 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' --header 'Content-Type: application/json' --data-raw '{\"text\": \"10 minutes remaining before server is terminated\",\"chat_id\": \"$chat_id\"}'" | at now +$(($ac_LIFE - 3)) minutes
echo "curl --location --request POST 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' --header 'Content-Type: application/json' --data-raw '{\"text\": \"Server is being terminated\",\"chat_id\": \"$chat_id\"}'" | at now +$ac_LIFE minutes


