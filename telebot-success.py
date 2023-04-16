import requests

# Replace <YOUR_API_TOKEN> with the actual API token of your bot
api_token = "6269444087:AAEXS3_4IEVx8grBTd5ptzIvg3OF6L6wML0"

# Replace <YOUR_CHAT_ID> with the actual chat ID of the group
chat_id = "-885207572"

# Replace <YOUR_MESSAGE_TEXT> with the actual message you want to send
message_text = "Pew Pew"

# Construct the API request URL
url = f"https://api.telegram.org/bot{api_token}/sendMessage"

# Construct the message payload
payload = {
    "chat_id": chat_id,
    "text": message_text,
}

# Send the message using the Telegram Bot API
response = requests.post(url, json=payload)
if response.status_code == 200:
    print("Message sent successfully")
else:
    print("Error sending message:", response.text)
