#/bin/bash

. /engn001/apache/2.4/servers/webd-apache_80/env.sh

SETUSER=${RUN_USER}
RUNNER=`whoami`

if [ ${RUNNER} != ${SETUSER} ] ;
    then echo "Deny Access : [ ${RUNNER} ]. Not [${SETUSER}]";
    exit 0;
fi

/engn001/apache/2.4/bin/apachectl -f /engn001/apache/2.4/servers/webd-apache_80/conf/httpd.conf -k stop