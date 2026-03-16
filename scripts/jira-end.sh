#!/bin/bash

PROJECT_KEY="DT"

FROM_STATUS="In dev"
TO_STATUS="Ready for dev"
TRANSITION_NAME="Ready for dev"

CONFIRMATION_REQUIRED="yes"

# ==============================================================================

echo "Attempting to move issues from status '$FROM_STATUS' to '$TO_STATUS'..."

JQL_QUERY="status = \"$FROM_STATUS\" AND assignee in (currentUser())"
if [ -n "$PROJECT_KEY" ]; then
    JQL_QUERY="project = \"$PROJECT_KEY\" AND $JQL_QUERY"
fi

echo "Searching for issues with JQL: $JQL_QUERY"

# Get a list of issue keys that are in the FROM_STATUS
ISSUE_KEYS=$(jira issue list --jql "$JQL_QUERY" --columns key --plain --no-headers 2>/dev/null)

if [ $? -ne 0 ]; then
    echo "Error: Failed to retrieve issues. Ensure jira-cli is configured and your JQL is valid."
    exit 1
fi

if [ -z "$ISSUE_KEYS" ]; then
    echo "No issues found in status '$FROM_STATUS'"
    exit 0
fi

echo "Found issues to transition:"
echo "$ISSUE_KEYS" | sed 's/^/  - /' # Prepend hyphen for readability

if [ "$CONFIRMATION_REQUIRED" == "yes" ]; then
    read -p "Do you want to proceed with transitioning these issues? (yes/no): " confirmation
    if [[ ! "$confirmation" =~ ^[Yy][Ee][Ss]$ ]]; then
        echo "Aborting."
        exit 0
    fi
fi

echo "Starting transition..."
while IFS= read -r ISSUE_KEY; do
    if [ -z "$ISSUE_KEY" ]; then
        continue
    fi
    echo "  Transitioning $ISSUE_KEY to '$TO_STATUS'..."

    jira issue transition "$ISSUE_KEY" "$TRANSITION_NAME" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "  Successfully transitioned $ISSUE_KEY."
    else
        echo "  Failed to transition $ISSUE_KEY. Possible reasons:"
        echo "    - No valid transition '$TRANSITION_NAME' from current status for this issue."
        echo "    - You do not have permissions to perform this transition."
        echo "    - The issue might already be in a different status."
    fi
done <<< "$ISSUE_KEYS"

echo "Script finished."
