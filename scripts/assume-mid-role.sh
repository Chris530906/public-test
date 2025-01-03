#!/bin/sh

temp_file=$(mktemp)
ROLE_ARN=$1
PROFILE=$2
DEFAULT_REGION=$3

aws sts get-caller-identity

echo "temp file: $temp_file"

aws sts assume-role --role-arn "$ROLE_ARN" --role-session-name "torque-runner"

OUT=$(aws sts assume-role --role-arn "$ROLE_ARN" --role-session-name "torque-runner" 2>>$temp_file)

export AWS_ACCESS_KEY_ID=$(echo $OUT | cut -d '"' -f 6)
export AWS_SECRET_ACCESS_KEY=$(echo $OUT | cut -d '"' -f 10)
export AWS_SESSION_TOKEN=$(echo $OUT | cut -d '"' -f 14)
rm -f $temp_file


aws sts get-caller-identity

echo "making dir"

mkdir -p /root/.aws
cat << EOF > /root/.aws/credentials
[$PROFILE]
aws_access_key_id=$AWS_ACCESS_KEY_ID
aws_secret_access_key=$AWS_SECRET_ACCESS_KEY
aws_session_token=$AWS_SESSION_TOKEN
EOF

cat << EOF > /root/.aws/config
[profile $PROFILE]
region=$DEFAULT_REGION
output=json
EOF