
QUERY='status WAS "Dev" DURING (startOfWeek(-1), endOfWeek(-1))'
jira issue list -q $QUERY --fields key,summary,status,updated
