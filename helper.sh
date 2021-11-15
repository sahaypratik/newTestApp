#!/bin/bash

# TODO: find a cleaner way to compose JSON
contents="$(jq -n \
   --arg k1 'appName' \
   --arg v1 "$1" \
   --arg k2 'appId' \
   --arg v2 "com.$1.connect" \
   --arg k3 'flavourName' \
   --arg v3 "$1" \
   --arg k4 'prefix' \
   --arg v4 "$1" \
   --arg k5 'appLabel' \
   --arg v5 "$1" \
   '. | .[$k1]=$v1 | .[$k2]=$v2 | .[$k3]=$v3 | .[$k4]=$v4 | .[$k5]=$v5' \
   <<<'{}'
)"
rm app/flavours/flavourfiles.json

echo "$contents"
echo "$contents"| jq -n '.flavours |= [inputs]'> app/flavours/flavourfiles.json
