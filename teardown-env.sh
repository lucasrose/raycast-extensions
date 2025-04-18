#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Teardown Env
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

echo "🧹 Tearing down environment..."

# Kill all iTerm2 instances
killall iTerm2 2>/dev/null && echo "✅ iTerm2 closed" || echo "⚠️ iTerm2 not running"

# Kill all node processes
pkill node 2>/dev/null && echo "✅ Node processes killed" || echo "⚠️ No node processes found"

sleep 1
echo "🧹 Teardown Complete"
