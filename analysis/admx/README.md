# ADMX: Architectural Dependency Model Extractor

ADMX is a model extractor that extracts Architectural Dependency Model (ADM) from the monitoring data. The ADM used by Hora to represent the architectural dependencies of the system.

## Requirement
ADMX requires the following services:
* [Kieker](https://github.com/spec-rgdevops/CASPA-platform/tree/master/monitoring/kieker) Monitoring Server to collect monitoring data from the application
* [InfluxDB](https://github.com/spec-rgdevops/CASPA-platform/tree/master/infrastructure/influxdb) to store monitoring data

## Deployment
* ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/analysis/admx/admx.yaml```

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `31101` ADMX web interface
