#!/bin/bash


# Generate lists of users in Terminal
op user list

op user list --format=json

op item get mysql

op item get sqlite --fields username,password

# get UUIDs of all login items and assign to array called loginIDs
loginIDs=($(op item list --categories Login --format=json | jq -r '.[].id'))

###
# GROUP MANAGEMENT
###

# list members of the IT group
op group user list IT

# Make Steven Steal (VKONWSAAO5EWVEIOS2D4PRFDQQ) a manager of the IT group (ulhyycgrutra7uaozif5a7mp3m)
op group user grant --group ulhyycgrutra7uaozif5a7mp3m --role manager --user VKONWSAAO5EWVEIOS2D4PRFDQQ

# list members of the IT group with Steven Steal included
op group user list IT

# Remove Stephen Steal from the IT Group
op group user revoke --group ulhyycgrutra7uaozif5a7mp3m --user VKONWSAAO5EWVEIOS2D4PRFDQQ


###
# VAULT MANAGEMENT
###



