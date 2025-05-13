#!/bin/sh

# Exit immediately if a command exits with a non-zero status
set -e

# Check if TOS_BUCKET is set, if not, print an error message and exit
if [ -z "$TOS_BUCKET" ]; then
  echo "TOS_BUCKET is not set. Quitting."
  exit 1
fi

# Check if TOS_ACCESS_KEY is set, if not, print an error message and exit
if [ -z "$TOS_ACCESS_KEY" ]; then
  echo "TOS_ACCESS_KEY is not set. Quitting."
  exit 1
fi

# Check if TOS_SECRET_KEY is set, if not, print an error message and exit
if [ -z "$TOS_SECRET_KEY" ]; then
  echo "TOS_SECRET_KEY is not set. Quitting."
  exit 1
fi

# Set TOS_REGION to "cn-beijing" if it is not already set
if [ -z "$TOS_REGION" ]; then
  TOS_REGION="cn-beijing"
fi

# Set TOS_ENDPOINT to "tos-${TOS_REGION}.volces.com" if it is not already set
if [ -z "$TOS_ENDPOINT" ]; then
  TOS_ENDPOINT="tos-${TOS_REGION}.volces.com"
fi

# Configure tosutil with the provided credentials and settings
tosutil config -i=${TOS_ACCESS_KEY} -k=${TOS_SECRET_KEY} -re=${TOS_REGION} -e=${TOS_ENDPOINT}

# Copy files from the source directory to the TOS bucket using tosutil
# If SOURCE_DIR is not set, use the current directory as the source
# If DEST_DIR is not set, use the root of the bucket as the destination
sh -c "tosutil cp ${SOURCE_DIR:-.} tos://${TOS_BUCKET}/${DEST_DIR} -r -flat"

# Remove the tosutil configuration file from the home directory
rm -rf ~/.tosutilconfig
