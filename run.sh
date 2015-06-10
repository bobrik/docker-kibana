#!/bin/sh

set -e

KIBANA_CONF_FILE="/opt/kibana-${KIBANA_VERSION}/config/kibana.yml"

KIBANA_ES_URL=${KIBANA_ES_URL:-http://elasticsearch:9200}

sed -i "s;^elasticsearch_url:.*;elasticsearch_url: ${KIBANA_ES_URL};" "${KIBANA_CONF_FILE}"

if [ -n "${KIBANA_INDEX}" ]; then
    echo "setting index!"
    sed -i "s;^kibana_index:.*;kibana_index: ${KIBANA_INDEX};" "${KIBANA_CONF_FILE}"
fi

# mesos-friendly change
unset HOST
unset PORT

exec /opt/kibana-${KIBANA_VERSION}/bin/kibana
