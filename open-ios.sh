#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open iOS
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.description Open Link on iOS

URL=$(pbpaste) # Get URL from clipboard

if [[ -z "$URL" ]]; then
  echo "Clipboard is empty!"
  exit 1
fi

xcrun simctl openurl booted "$URL"

echo "Opened $URL in iOS Simulator"