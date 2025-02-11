#!/bin/bash

BEARER=$1
EMOJIDIR="emojis"

mkdir -p "$EMOJIDIR"

# Fetch emoji list and filter out aliases
LIST=$(curl -s -H "Authorization: Bearer $BEARER" https://slack.com/api/emoji.list | jq -r '.emoji | to_entries[] | select(.value | startswith("http")) | "\(.key) \(.value)"')

while IFS= read -r line; do
  NAME=$(echo "$line" | awk '{print $1}')
  URL=$(echo "$line" | awk '{print $2}')
  
  echo "Downloading: $NAME -> $URL"

  # Extract file extension
  EXT="${URL##*.}"
  
  # Sanitize filename (remove special characters)
  SAFE_NAME=$(echo "$NAME" | tr -cd '[:alnum:]_-')

  curl -s -H "Authorization: Bearer $BEARER" -o "$EMOJIDIR/$SAFE_NAME.$EXT" "$URL"
done <<< "$LIST"

echo "Download complete! 🎉"
