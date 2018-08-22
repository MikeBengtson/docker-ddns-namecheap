#!/bin/bash

# Script to configure the update-ip script with the params given at the container run.

sed -i.bak "s/^DOMAIN=.*$/DOMAIN=\"$DOMAIN\"/g" /usr/bin/NamecheapDdnsUpdate.sh && \
sed -i.bak "s/^PASSWORD=.*$/PASSWORD=\"$PASSWORD\"/g" /usr/bin/NamecheapDdnsUpdate.sh && \
sed -i.bak "s/^HOSTS=.*$/HOSTS=\($HOSTS\)/g" /usr/bin/NamecheapDdnsUpdate.sh && \
sed -i.bak "s/^EMAIL=.*$/EMAIL=\"$EMAIL\"/g" /usr/bin/NamecheapDdnsUpdate.sh

exit 0
