## run prometheus on docker

Components

- prometheus
- alert-manager (to slack)
- node_exporter
- cAdvisor
- grafana

## Getting started

* launch with docker-compose.

```bash
docker-compose up
```

* open grafana http://localhost:3000
* open `Data Souces` and add Prometheus https://prometheus:9090 and save.

## Dashbaords

* add Prometheus 2.0 Stats, open `Data Source` > prometheus > dashboard tab > add `Prometheus 2.0 Stats`.
* add node_exporter 1.8 dashboard, open `Dashboard` > Manage > Import > https://grafana.com/grafana/dashboards/1860
* add cAdvisor dashboard, open `Dashboard` > Manage > Import > https://grafana.com/grafana/dashboards/179

## Notice

* Prometheus database is persistent via docker-compose volumes mount.
* Grafana database is persistent via docker-compose volumes mount.

## Alert

* set slack webhook url in `alertmanager/config.yml`.
* see your rule is shown up on http://localhost:9090/alerts
* run stack via `docker-compose up`.
* stop node_exporter container via `docker stop node-exporter`.
* alert will trigger in 15sec.
