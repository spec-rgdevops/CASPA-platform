# Hora: Hierarchical Online Failure Prediction

Hora is an online failure prediction approach that aims to predict cascading failures in distributed systems.

## Requirement
Hora requires the following services:
* Kieker Monitoring Server to collect monitoring data from the application
* InfluxDB to store monitoring data and the prediction results
* (Optional) Grafana to visualize the monitoring data and the prediction results

These services are parts of the CASPA platform and the setup instructions can be found in the corresponding directories.

## Deployment
* ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/analysis/hora/hora.yaml```

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `31100` Hora web interface
