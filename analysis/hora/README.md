# Hora: Hierarchical Online Failure Prediction

Hora is an online failure prediction approach that aims to predict cascading failures in distributed systems.

## Requirement
Hora requires the following services:
* [Kieker Monitoring Server](https://github.com/spec-rgdevops/CASPA-platform/tree/master/monitoring/kieker) to collect monitoring data from the application
* [InfluxDB](https://github.com/spec-rgdevops/CASPA-platform/tree/master/infrastructure/influxdb) to store monitoring data and the prediction results
* (Optional) [Grafana](https://github.com/spec-rgdevops/CASPA-platform/tree/master/infrastructure/grafana) to visualize the monitoring data and the prediction results

## Deployment
* ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/analysis/hora/hora.yaml```

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `31100` Hora web interface
