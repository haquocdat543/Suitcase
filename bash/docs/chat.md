# CHAT

## 1. API
### 1. Script
#### 1. Slack
```bash
#!/bin/bash

# Variables
MESSAGE="Hello, World!"
URL="https://hooks.slack.com/services/T0760J2S28Y8B09JF1U4BDY/z7odA6KYJnjsbtUGGibOKokV"

# Send the notification
curl -X POST -H 'Content-type: application/json' \
  -d '{"text":"${MESSAGE}"}' ${URL}
```

#### 2. Telegram
```bash
#!/bin/bash

# Variables
TOKEN="your_bot_token_here"
CHAT_ID="your_chat_id_here"
MESSAGE="Your message here"

# Send the notification
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
  -d chat_id="$CHAT_ID" \
  -d text="$MESSAGE"
```
