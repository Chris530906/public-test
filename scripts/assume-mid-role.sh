#!/bin/sh

temp_file=$(mktemp)

aws sts get-caller-identity

aws sts assume-role --role-arn "$1" --role-session-name "torque-runner"

OUT=$(aws sts assume-role --role-arn "$1" --role-session-name "torque-runner" 2>>$temp_file)
if [[ $? -eq 0 ]]; then
    export AWS_ACCESS_KEY_ID=$(echo $OUT | cut -d '"' -f 6)
    export AWS_SECRET_ACCESS_KEY=$(echo $OUT | cut -d '"' -f 10)
    export AWS_SESSION_TOKEN=$(echo $OUT | cut -d '"' -f 14)
    echo "Role [ $role ] Assumed"
    echo "Session name: $current_session_name"
    export TERRAGRUNT_SESSION_NAME=$current_session_name
    rm -f $temp_file
    aws sts get-caller-identity
    return 0
fi

echo "skipped if"
aws sts get-caller-identity


