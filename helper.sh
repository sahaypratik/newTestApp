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
   --arg k5 'applabel' \
   --arg v5 "$1" \
   --arg k6 'introsliders' \
   --arg v6 "false" \
   --arg k7 'site_base_url' \
   --arg v7 "demo.winuall.com" \
   --arg k8 'playstore_account' \
   --arg v8 "hopelabs" \
   --arg k9 'imageUrl' \
   --arg v9 "https://api-files-connect.s3.ap-south-1.amazonaws.com/1607707178247.png" \
   '. | .[$k1]=$v1 | .[$k2]=$v2 | .[$k3]=$v3 | .[$k4]=$v4 | .[$k5]=$v5 | .[$k6]=$v6| .[$k7]=$v7| .[$k8]=$v8| .[$k9]=$v9' \
   <<<'{}'
)"
rm app/flavours/flavourfiles.json

echo "$contents"
echo "$contents"| jq -n '.flavours |= [inputs]'> app/flavours/flavourfiles.json
