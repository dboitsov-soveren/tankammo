#! /bin/bash

echo "Updating ammo urls"
TMPPATH=$(echo $RANDOM | base64 | head -c 25)
sed -i -e 's/randomPath/'${TMPPATH}'/g' ${AMMO_FILE}

echo "Preparing config and running tank"

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
  token_file: "token.txt"' > load2.yaml
yandex-tank -c load2.yaml ${AMMO_FILE}
