#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Refresh AWS
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

source ~/.zshrc && aws sso login

