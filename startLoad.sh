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
  address: a9f9684208c7946e09ace815dcf598df-1b9147536e3097a4.elb.eu-west-1.amazonaws.com:9000
  load_profile:
    load_type: rps
    schedule: line(1, '${RPS}', '${WARMUP}') const ('${RPS}', '${DURATION}')
  ssl: '${ENABLE_SSL}'
  multi:
    - address: a197f77c4251845adab0de156debbf78-328989716.eu-west-1.elb.amazonaws.com:9000
      load_profile:
        load_type: rps
        schedule: line(1, '${RPS}', '${WARMUP}') const ('${RPS}', '${DURATION}')
      ssl: '${ENABLE_SSL}'
    - address: a272cf379cf0f430eaf2b24e176ccefa-d8a07963be221813.elb.eu-west-1.amazonaws.com:9000
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
