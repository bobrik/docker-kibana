FROM alpine:3.1

ENV KIBANA_VERSION 4.0.2-linux-x64

RUN apk --update add curl && \
    mkdir /opt && \
    curl -s https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz | tar zx -C /opt && \
    apk add nodejs && \
    rm -rf /opt/kibana-${KIBANA_VERSION}/node && \
    mkdir -p /opt/kibana-${KIBANA_VERSION}/node/bin && \
    ln -sf /usr/bin/node /opt/kibana-${KIBANA_VERSION}/node/bin/node && \
    apk del curl

ADD ./no-highlight.patch /tmp/no-highlight.patch

RUN cd /opt/kibana-${KIBANA_VERSION} && \
    patch -p1 < /tmp/no-highlight.patch

ADD ./run.sh /run.sh

EXPOSE 5601

ENTRYPOINT /run.sh
