#!/bin/bash

# Dunst calls this script with: appname summary body icon urgency
APPNAME=$1
SUMMARY=$2
BODY=$3
ICON=$4
URGENCY=$5

reply_action () {
    echo "Reply action triggered for: $SUMMARY"
    # Add your reply logic here
}

forward_action () {
    echo "Forward action triggered for: $SUMMARY"
    # Add your forward logic here
}

handle_dismiss () {
    echo "Notification dismissed: $SUMMARY"
}

# Handle different notification types
case "$SUMMARY" in
"Message Received")
    reply_action
    ;;
"Forward Request")
    forward_action
    ;;
*)
    echo "Generic notification: $SUMMARY - $BODY"
    ;;
esac
