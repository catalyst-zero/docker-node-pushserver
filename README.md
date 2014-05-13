# docker-node-pushserver

node-pushserver in a docker container, backed with [mongodb](https://github.com/tutumcloud/tutum-docker-mongodb).

###### build
```bash
docker build -t node-pushserver .
```

###### run
To run the containerized node-pushserver, one need to mount a volume containing
APN certificates. Also some environment variables are required.
```bash
docker run \
  -v /your/config/dir/:/mnt/node-pushserver/ \
  -e WEB_PORT=$WEB_PORT \
  -e MONGODB_USER=$MONGODB_USER \
  -e MONGODB_PASS=$MONGODB_PASS \
  -e GCM_API_KEY=$GCM_API_KEY \
  -e APN_CONNECTION_GATEWAY=$APN_CONNECTION_GATEWAY \
  -e APN_FEEDBACK_ADDRESS=$APN_FEEDBACK_ADDRESS \
  --link mongodb:mongodb \
  node-pushserver
```
