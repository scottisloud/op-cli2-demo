#!/bin/bash


# Generate lists of users in Terminal
op user list

op user list --format=json

op item get Instagram

op item get Instagram --fields username,password

# get UUIDs of all login items and assign to array called loginIDs
loginIDs=($(op item list --categories Login --format=json | jq -r '.[].id'))


op user invite --name "Nick Fury" --email "scott.lougheed+895445624@agilebits.com"
op group user grant --group "The Avengers" --user "Nick Fury"

###
# GROUP MANAGEMENT
###

# Create a group called The Avengers 
op group create "The Avengers" --description "The people who keep the world safe"

# Create an array of UUIDs for the avengers. 
avengers=(EFY6OJPJ3VACPNA4RUTMG45PJE NVIMFML4CFFTBFJFL6XVR6HXTU DCJGVAOEYBEPNIOPMOVRH5MOKY SDV7PHFZDBFLXB7XQOHC7UBYSU WFVQSCRPKJBMVH56PN6ZJG2WDU B2J5KCY4EBFVZLHELT5ABWFYRE)

# loop through all avengers and add them to the group
for avenger in $avengers; do op group user grant --group "The Avengers" --user $avenger; done 

# invite a fearless leader to the team
op user invite --name "Nick Fury" --email "scott.lougheed+895445624@agilebits.com"

# add that leader to the Avengers group
op group user grant --group "The Avengers" --user "Nick Fury" --role manager

op group user list "The Avengers"

###
# VAULT MANAGEMENT
###
# Create some "permissions templates"
user_permissions=view_items,view_and_copy_passwords,view_item_history
admin_permissions=view_items,view_and_copy_passwords,view_item_history,create_items,edit_items,archive_items,delete_items,import_items,export_items,print_items

# create a vault with all the super hero secrets
op vault create "Avengers Project" --description "Info to support team of heroes who keep the world safe"

# give the heroes view-related permissions
op vault group grant --group "The Avengers" --permissions $user_permissions

# give our leader some advanced permissions
op vault user grant --user "Nick Fury" --permissions $admin_permissions

# Create a document item with a proposed website banner
cd ~/op-cli2-demo/account-mgmt
op document create 'banner.jpg' --title "Proposed website banner" --vault "Avengers Project"
