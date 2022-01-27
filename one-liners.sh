#!/bin/bash


# Generate lists of users in Terminal
op user list

op user list --format=json

op item get sqlite

op item get sqlite --fields username,password

# get UUIDs of all login items and assign to array called loginIDs
loginIDs=($(op item list --categories Login --format=json | jq -r '.[].id'))