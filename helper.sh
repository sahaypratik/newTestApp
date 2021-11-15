#!/bin/bash

# TODO: find a cleaner way to compose JSON
contents="$(jq -n \
   --arg k1 'appName' \
   --arg v1 "$1" \
   --arg k2 'appId' \
   --arg v2 "$2" \
   --arg k3 'flavourName' \
   --arg v3 "$3" \
   --arg k4 'prefix' \
   --arg v4 "$4" \
   --arg k5 'appLabel' \
   --arg v5 "$5" \
   --arg k6 'imageUrl' \
   --arg v6 "$6" \
   --arg k7 'introsliders' \
   --arg v7 "$7" \
   '. | .[$k1]=$v1 | .[$k2]=$v2 | .[$k3]=$v3 | .[$k4]=$v4 | .[$k5]=$v5| .[$k6]=$v6| .[$k7]=$v7' \
   <<<'{}'
)"
rm app/flavours/flavourfiles.json

echo "$contents"
echo "$contents"| jq -n '.flavours |= [inputs]'> app/flavours/flavourfiles.json
