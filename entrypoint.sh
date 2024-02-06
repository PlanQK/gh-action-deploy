#!/bin/sh

cd $GITHUB_WORKSPACE
SERVICE_ID=$(awk -F'["]' '/"serviceId":/ {print $4}' planqk.json)
if [ -n "$SERVICE_ID" ]; then
    npm install -g @anaqor/planqk
    planqk login -t $INPUT_PLANQK_TOKEN
    planqk set-context $INPUT_CONTEXT_ID
    planqk up --silent
    if [ $? -gt 0 ]; then
        echo "planqk up failed (return code not 0)."
    fi
else
    echo "No service id given, aborting action"
fi
