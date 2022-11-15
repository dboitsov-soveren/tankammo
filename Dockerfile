# Yandex.Tank - Soveren
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

RUN git init && \
    git remote add origin https://github.com/dboitsov-soveren/tankammo.git && \
    git pull origin main

RUN chmod 777 ./tank.sh

ENTRYPOINT ["/usr/local/bin/yandex-tank"]