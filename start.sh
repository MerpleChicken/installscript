#/bin/bash

. /engn001/apache/2.4/servers/webd-apache_80/env.sh

SETUSER=${WAS_USER}
RUNNER=`whoami`

if [ ${RUNNER} != ${SETUSER} ] ;
    then echo "Deny Access : [ ${RUNNER} ]. Not [${SETUSER}]";
    exit 0;
fi

/engn001/apache/2.4/bin/apachectl -f /engn001/apache/2.4/servers/webd-apache_80/conf/httpd.conf -k start
#LD_LIBRARY_PATH=${CATALINA_HOME}/LD_LIBRARY_PATH
#export LD_LIBRARY_PATH

#LOG_HOME=${CATALINA_BASE}/logs
#export LOG_HOME

#rm -rf ${CATALINA_BASE}/temp/*
#rm -rf ${CATALINA_BASE}/work/*

#DATE=`date _%Y-%m-%d_%H-%M-%S`

#mv ${LOG_HOME}/gc_${INST_NAME}.log ${LOG_HOME}/gclog/gc_${INST_NAME}.log.${DATE}
#mv ${LOG_HOME}/${INST_NAME}.out ${LOG_HOME}/nohup/${INST_NAME}.out.${DATE}

#JAVA_OPTS="${JAVA_OPTS} -D${INST_NAME} -Xmx1024m -Xm"
