#!/bin/sh

aws sts get-caller-identity

aws sts assume-role --role-arn "$1" --role-session-name "torque-runner"

aws sts get-caller-identity