#!/bin/bash

# Set defaults.
DEFAULT_WEB_PORT="80"
DEFAULT_MONGODB_USER="admin"
DEFAULT_MONGODB_PASS=""

DEFAULT_GCM_API_KEY=""

DEFAULT_APN_CONNECTION_GATEWAY=""
DEFAULT_APN_FEEDBACK_ADDRESS=""

# Set variables.
WEB_PORT=${WEB_PORT:-$DEFAULT_WEB_PORT}
MONGODB_USER=${MONGODB_USER:-$DEFAULT_MONGODB_USER}
MONGODB_PASS=${MONGODB_PASS:-$DEFAULT_MONGODB_PASS}

GCM_API_KEY=${GCM_API_KEY:-$DEFAULT_GCM_API_KEY}

APN_CONNECTION_GATEWAY=${APN_CONNECTION_GATEWAY:-$DEFAULT_APN_CONNECTION_GATEWAY}
APN_FEEDBACK_ADDRESS=${APN_FEEDBACK_ADDRESS:-$DEFAULT_APN_FEEDBACK_ADDRESS}

DEFAULT_MONGODB_URL="mongodb://${MONGODB_USER}:${MONGODB_PASS}@${MONGODB_PORT_28017_TCP_ADDR}/pushserver"

# Create config.
cat config.tmpl \
  | sed -e "s/\%\%WEB_PORT\%\%/$WEB_PORT/" \
  | sed -e "s/\%\%MONGODB_URL\%\%/$MONGODB_URL/" \
  | sed -e "s/\%\%GCM_API_KEY\%\%/$GCM_API_KEY/" \
  | sed -e "s/\%\%APN_CONNECTION_GATEWAY\%\%/$APN_CONNECTION_GATEWAY/" \
  | sed -e "s/\%\%APN_FEEDBACK_ADDRESS\%\%/$APN_FEEDBACK_ADDRESS/" > config.json

node-pushserver -c ./config.json
