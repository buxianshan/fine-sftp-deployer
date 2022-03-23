#!/bin/sh

set -eu
# required parameters
USERNAME=$1
SERVER=$2
PORT=$3
SSH_PRIVATE_KEY_STRING=$4
LOCAL_PATH=$5
REMOTE_PATH=$6
CLEAR_REMOTE_PATH=$7

SSH_KEY_FILE='../private_key.pem'
TEMP_SFTP_FILE='../sftp'
printf "%s" "$SSH_PRIVATE_KEY_STRING" >$SSH_KEY_FILE
chmod 600 $SSH_KEY_FILE

if $CLEAR_REMOTE_PATH
then
    echo 'ssh start'
    # delete all files in directory $REMOTE_PATH
    ssh -o StrictHostKeyChecking=no -p PORT -i $SSH_KEY_FILE $USERNAME@$SERVER "cd $REMOTE_PATH; rm -rf ./*"
    echo 'clear remote path success'
else
  echo 'do not clear remote path'
fi

echo 'sftp start'
printf "%s" "put -r $LOCAL_PATH $REMOTE_PATH" >$TEMP_SFTP_FILE
sftp -b $TEMP_SFTP_FILE -P $PORT -o ConnectTimeout=5 -o StrictHostKeyChecking=no -i $SSH_KEY_FILE $USERNAME@$SERVER

echo 'deploy success'
exit 0

