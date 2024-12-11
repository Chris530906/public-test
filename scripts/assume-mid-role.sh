#!/bin/sh

aws sts get-caller-identity

aws sts assume-role --role-arn "$1"

aws sts get-caller-identity