#! /bin/bash

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