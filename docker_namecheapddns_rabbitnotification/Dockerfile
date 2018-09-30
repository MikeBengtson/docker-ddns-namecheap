FROM ddns:latest

LABEL maintainer="http://alejandro.lorente.info"

COPY pi_notifications/docker_pubsub_basic/rabbit_producer_basic.py /usr/bin
COPY pi_notifications/docker_pubsub_basic/log_watchdog.sh /usr/bin

RUN apk add --update python3 && \
    pip3 install pika && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

ENV RABBIT_HOSTNAME rabbit
ENV RABBIT_USER guest
ENV RABBIT_PW guest
ENV RABBIT_EXCHANGE ddns_notifications
ENV DEBUG FALSE

WORKDIR /mnt

CMD configure.sh && \
    while true; do \
        NamecheapDdnsUpdate.sh | \
            log_watchdog.sh "^.*$" \
                "rabbit_producer_basic.py --host $RABBIT_HOSTNAME --exchange $RABBIT_EXCHANGE --user $RABBIT_USER --pw $RABBIT_PW --message \"DDNS: \$line\"" ; \
        sleep $SECONDS ; \
    done
