#!/bin/sh

if [ -z "$INPUT_PLANQK_TOKEN" ]; then
    echo "Input variable 'PLANQK_TOKEN' is not set, aborting action"
    exit 1
fi
if [ -z "$INPUT_CONTEXT_ID" ]; then
    echo "Input variable 'CONTEXT_ID' is not set, aborting action"
    exit 1
fi

cd $GITHUB_WORKSPACE

SERVICE_ID=$(awk -F'["]' '/"serviceId":/ {print $4}' planqk.json)
if [ -z "$SERVICE_ID" ]; then
    echo "No service id found in planqk.json, aborting action"
    exit 1
fi

npm install -g @anaqor/planqk
planqk login -t $INPUT_PLANQK_TOKEN
planqk set-context $INPUT_CONTEXT_ID
planqk up --silent

if [ "$?" != "0" ]; then
    echo "Command 'planqk up' failed (return code $?)"
fi

exit $?
