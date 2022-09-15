# Yandex.Tank
#
# VERSION 0.0.4

FROM direvius/yandex-tank

LABEL Description="Fresh Yandex.Tank from github master branch with phantom" \
    Vendor="Yandex" \
    maintainer="direvius@yandex-team.ru" \
    YandexTank.version="${VERSION}" \
    Telegraf.version="${TELEGRAF_VERSION}"
    
VOLUME ["/var/loadtest"]
WORKDIR /var/loadtest

RUN  wget https://raw.githubusercontent.com/dboitsov-soveren/tankammo/main/ammoHugeTraffic.txt && \
    wget https://raw.githubusercontent.com/dboitsov-soveren/tankammo/main/ammoRPS.txt && \
    wget https://raw.githubusercontent.com/dboitsov-soveren/tankammo/main/load.yaml && \
    wget https://raw.githubusercontent.com/dboitsov-soveren/tankammo/main/loadHuge.yaml && \
    wget https://raw.githubusercontent.com/dboitsov-soveren/tankammo/main/tank.sh && \
    wget https://raw.githubusercontent.com/dboitsov-soveren/tankammo/main/token.txt

RUN chmod 777 ./tank.sh
        
ENTRYPOINT ["/usr/local/bin/yandex-tank"]