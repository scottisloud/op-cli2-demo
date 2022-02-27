# AWS requires two secrets for most tasks.
# By default, and without additional planning, these secrets are stored unencrypted in a file. 
# With `op`, plaintext credentials can be replaced with `op` secrets references 
# You can even use variables to define multiple environments to load the correct credentials for that environment, such as $dev and $prod

# this command will copy a file to an AWS S3 bucket 
op run --env-file=.env --account bluemountainsit -- aws s3 cp ../account-mgmt/banner.jpg s3://enablement-demo

# uploaded file available at https://enablement-demo.s3.ca-central-1.amazonaws.com/banner.jpg