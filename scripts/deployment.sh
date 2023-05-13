#!/bin/bash

scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r ./docker-compose.yaml $WEB_SERVER_SSH_HOST:$COMPOSE_FILE_DIR/$COMPOSE_FILE_NAME
ssh $WEB_SERVER_SSH_HOST 'docker system prune -af'
ssh $WEB_SERVER_SSH_HOST "docker login ghcr.io -u $REGISTRY_USERNAME -p $REGISTRY_TOKEN"
ssh $WEB_SERVER_SSH_HOST "docker stack deploy --with-registry-auth --prune --resolve-image=always -c $COMPOSE_FILE_DIR/$COMPOSE_FILE_NAME node"
sleep 15