# ADMX: Architectural Dependency Model Extractor

ADMX is a model extractor that extracts Architectural Dependency Model (ADM) from the monitoring data. The ADM used by Hora to represent the architectural dependencies of the system.

## Requirement
ADMX requires the following services:
* Kieker Monitoring Server to collect monitoring data from the application
* InfluxDB to store monitoring data

These services are parts of the CASPA platform and the setup instructions can be found in the corresponding directories.

## Deployment
* ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/analysis/admx/admx.yaml```

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `31101` ADMX web interface
