FROM redis:6.0-alpine3.15
ENV EXPORTER_VERSION=1.34.1
RUN apk add --no-cache curl
COPY run-redis.sh /
RUN curl -sL -o redis_exporter.tar.gz https://github.com/oliver006/redis_exporter/releases/download/v${EXPORTER_VERSION}/redis_exporter-v${EXPORTER_VERSION}.linux-amd64.tar.gz \
    && redis_exporter_sha512=$(curl --location https://github.com/oliver006/redis_exporter/releases/download/v${EXPORTER_VERSION}/sha256sums.txt -s | grep "v${EXPORTER_VERSION}.linux-amd64" | cut -d' ' -f1) \
    && echo "$redis_exporter_sha512  redis_exporter.tar.gz" | sha256sum -c - \
    && mkdir /exporter \
    && tar -C /tmp -xf redis_exporter.tar.gz && cp /tmp/redis_exporter-v${EXPORTER_VERSION}.linux-amd64/redis_exporter /exporter/ && rm -rf /tmp/exporter && rm redis_exporter.tar.gz \
    && chmod +x /run-redis.sh
EXPOSE 9121
# CMD ["/exporter/redis_exporter", "&" "redis-server"]
ENV REDIS_VERSION=6.0
CMD ["/run-redis.sh"]