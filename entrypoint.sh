#!/usr/bin/env sh

if [ -z "$SSH_PORT" ]; then
    SSH_PORT=22
fi

eval $(ssh-agent -s)
echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan -p $SSH_PORT $SSH_HOST >> ~/.ssh/known_hosts
chmod 644 ~/.ssh/known_hosts

exec "$@"
