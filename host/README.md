## run prometheus on host machine

Components

- prometheus
- grafana
- exporter: 
    - windows: wmi_exporter
    - mac/linux: TBA

## Prerequisites

make sure gow and 7zip is isntalled.

```
scoop install gow 7zip
```

## Getting started

* launch with cmd.

```bash
git clone https://github.com/guitarrapc/prometheus-lab.git
cd prometheus-lab
cd host
setup.bat
```

* open http://localhost:9090 for prometheus.
* open http://localhost:3030 for grafana.
* open `Data Souces` and add Prometheus https://localhost:9090 and save.
* add wmi_exporter 1.8 dashboard, open `Dashboard` > Manage > Import > https://grafana.com/dashboards/8781

## clean up

stop chrome and wmi_exporter, then remove `%userprofile%/Downloads/prometheus` directory.
