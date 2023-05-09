#!/bin/bash

scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r ./docker-compose.yaml $WEB_SERVER_SSH_HOST:$COMPOSE_FILE_DIR/$COMPOSE_FILE_NAME
ssh $WEB_SERVER_SSH_HOST 'docker system prune -af'
ssh $WEB_SERVER_SSH_HOST "docker login ghcr.io -u $REGISTRY_USERNAME -p $REGISTRY_TOKEN"
ssh $WEB_SERVER_SSH_HOST "docker compose -f $COMPOSE_FILE_DIR/$COMPOSE_FILE_NAME pull"
ssh $WEB_SERVER_SSH_HOST "docker compose -f $COMPOSE_FILE_DIR/$COMPOSE_FILE_NAME up -d"
sleep 15