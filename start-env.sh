#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Env
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

#!/bin/bash

# Commands to run in each tab
commands=(
  "echo 'Starting web server...'; ws"
  "echo 'Starting admin server...'; as"
  "echo 'Starting sst...'; ss"
  "echo 'Starting gql...'; gs"
  "echo 'Starting drizzle studio...'; ds"
  "echo 'Empty tab';"
)

# Open iTerm and run each command in a new tab
osascript <<EOF
tell application "iTerm"
  activate
  set newWindow to (create window with default profile)
  tell current session of newWindow
    write text "${commands[0]}"
  end tell

  $(for ((i=1; i<${#commands[@]}; i++)); do
    echo "tell newWindow"
    echo "  set newTab to (create tab with default profile)"
    echo "  tell current session of newTab"
    echo "    write text \"${commands[$i]}\""
    echo "  end tell"
    echo "end tell"
  done)
end tell
EOF

sleep 1
# Close all extra iTerm windows (other than the first one)
osascript <<EOF
tell application "iTerm"
  -- Get all open windows
  set windowList to windows

  -- Check if there are more than one window
  if (count of windowList) > 1 then
    -- Close all windows except the first one
    repeat with i from 2 to (count of windowList)
      set currentWindow to item i of windowList
      close currentWindow
    end repeat
  end if
end tell
EOF

echo "✅ Environment Started"

