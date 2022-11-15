#! /bin/bash

echo 'Starting data generation'

TMPPATH=$(echo $RANDOM | base64 | head -c 25)

echo TMPPATH

sed -i -e 's/randomPath/'${TMPPATH}'/g' ${AMMO_FILE}

echo 'phantom:
  instances: '${THREADS}'
  timeout: 10s
  ammo_type: uripost
  header_http: "1.1"
  address: '${URL}'
  load_profile:
load_type: rps
schedule: line(1, '${RPS}', '${WARMUP}') const ('${RPS}', '${DURATION}')
  ssl: '${ENABLE_SSL}'
console:
  enabled: true
telegraf:
  enabled: false
overload:
  enabled: true
  package: yandextank.plugins.DataUploader
  token_file: "token.txt"' > load.yaml
read -p "Press [Enter] key to start backup..."

yandex-tank -c load.yaml ${AMMO_FILE}
