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

RUN  wget https://github.com/dboitsov-soveren/tankammo/blob/main/ammo_huge.txt
    
ENTRYPOINT ["/usr/local/bin/yandex-tank"]