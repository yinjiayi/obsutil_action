#!/bin/sh

set -e

if [ -z "$AWS_S3_BUCKET" ]; then
  echo "AWS_S3_BUCKET is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
  echo "AWS_ACCESS_KEY_ID is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "AWS_SECRET_ACCESS_KEY is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_REGION" ]; then
  AWS_REGION="us-east-1"
fi

if [ -n "$AWS_S3_ENDPOINT" ]; then
  ENDPOINT_APPEND="--endpoint-url $AWS_S3_ENDPOINT"
fi

obsutil config -i=${AWS_ACCESS_KEY_ID} -k=${AWS_SECRET_ACCESS_KEY} -e=${AWS_S3_ENDPOINT}

sh -c "obsutil sync ${SOURCE_DIR:-.} obs://${AWS_S3_BUCKET}/${DEST_DIR} $*"
