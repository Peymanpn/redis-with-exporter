# Redis With Exporter

Redis server with Prometheus [redis exporter](https://github.com/oliver006/redis_exporter) included.

built on top of default Redis Alpine docker image

## Sample usage - docker-compose

the docker compose file contains services to run and scrape redis exporter.

After running the [docker-compose file](docker-compose.yaml), head to the `localhost:3000` and open Grafan with the password provided in docker compose file. Add data source to Prometheus with address `http://prometheus:9090`

Now you can create your custom dashboard or import the redis exporter dashboard ID `763`.

Grafana dashboard is available on [grafana](https://grafana.com/dashboards/763) and/or [github](https://github.com/oliver006/redis_exporter/blob/master/contrib/grafana_prometheus_redis_dashboard.json).


Note: All ports are exposed for the sake of testing, you may want to remove those port mappings.

## Redis Exporter

The exporter used in this image is from the project [redis_exporter](https://github.com/oliver006/redis_exporter).