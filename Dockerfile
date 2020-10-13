FROM debian:stretch-slim

RUN set -ex \
    && apt-get clean && apt-get update \
    && apt-get install -y curl \
    && apt-get install -y jq \
    && apt-get install -y cron \
    && rm -rf /var/lib/apt/lists/* \
    && mkfifo --mode 0666 /var/log/cron.log \
    && sed --regexp-extended --in-place \
    's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' \
    /etc/pam.d/cron

COPY start-cron /usr/sbin

ENTRYPOINT ["start-cron"]