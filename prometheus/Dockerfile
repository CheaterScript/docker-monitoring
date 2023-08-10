ARG PROMETHEUS_VERSION

FROM prom/prometheus:${PROMETHEUS_VERSION}

USER root

RUN rm -f /etc/localtime \
&& ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/timezone
