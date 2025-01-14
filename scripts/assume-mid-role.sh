#!/bin/sh

temp_file=$(mktemp)
ROLE_ARN=$1
PROFILE=$2
DEFAULT_REGION=$3

aws sts get-caller-identity

# if (ROLE_ARN -eq aws sts get-caller-identity --query Arn)

current_arn=$(aws sts get-caller-identity --query Arn --output text)
target_arn=$1

current_role=$(echo "$current_arn" | sed -n 's|.*:assumed-role/\([^/]*\)/.*|\1|p')
current_account=$(echo "$curren_arn" | sed -n 's|.*:sts::\([0-9]*\):.*|\1|p')

# Extract the role name and account ID from the target ARN
target_role=$(echo "$target_arn" | sed -n 's|.*:role/\([^/]*\)$|\1|p')
target_account=$(echo "$target_arn" | sed -n 's|.*:iam::\([0-9]*\):.*|\1|p')

if [[ "$current_role" == "$target_role" && "$current_account" == "$target_account" ]]; then
  echo "Already in the target role ($current_role in account $current_account). Doing nothing."
  exit 0
else

echo "temp file: $temp_file"

aws sts assume-role --role-arn "$ROLE_ARN" --role-session-name "torque-runner"

OUT=$(aws sts assume-role --role-arn "$ROLE_ARN" --role-session-name "torque-runner" 2>>$temp_file)

export AWS_ACCESS_KEY_ID=$(echo $OUT | cut -d '"' -f 6)
export AWS_SECRET_ACCESS_KEY=$(echo $OUT | cut -d '"' -f 10)
export AWS_SESSION_TOKEN=$(echo $OUT | cut -d '"' -f 14)
rm -f $temp_file

NEW_AWS_ROLE_ARN=$(aws sts get-caller-identity --query Arn)

export AWS_ROLE_ARN=$NEW_AWS_ROLE_ARN
export AWS_PROFILE=$PROFILE
export AWS_WEB_IDENTITY_TOKEN_FILE=""

echo "export AWS_PROFILE=$PROFILE" >> ~/torque-envs.sh
echo "export AWS_ROLE_ARN=$NEW_AWS_ROLE_ARN" >> ~/torque-envs.sh
echo 'export AWS_WEB_IDENTITY_TOKEN_FILE=""' >> ~/torque-envs.sh

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