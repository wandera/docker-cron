# docker-cron

Linux cron running inside a container, with a few utilities made available on top (jq, curl).

## How to use
```bash
docker run --name some \
    -v $(pwd):/cron/ \
    wanderadock/docker-cron start-cron --user www-data \
    "\* \* \* \* \* /bin/bash -c '/cron/your_command.sh' >> /var/log/cron.log 2>&1"
```
