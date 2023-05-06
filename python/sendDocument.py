import os
import sys
import requests
import json
import logging


bot_token = sys.argv[1]
bot_chatId = sys.argv[2]
file_location = sys.argv[3]
caption = sys.argv[4]

send_document = 'https://api.telegram.org/bot' + bot_token +'/sendDocument?'
data = {
  'chat_id': bot_chatId,
  'parse_mode':'HTML',
  'caption': caption
}
# Need to pass the document field in the files dict
files = {
    'document': open(file_location, 'rb')
}
try:    
    r = requests.post(send_document, data=data, files=files, stream=True)
except Exception as e:
    print(e)
