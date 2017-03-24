# InfluxDB

InfluxDB is used to store monitoring data collected by application performance monitoring tools.
Although Kubernetes already provides one instance of InfluxDB (in `kube-system` namespace), the resource limit is quite limited.

## Deployment
InfluxDB can be deployed by executing:
* ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/infrastructure/influxdb/influxdb.yaml```

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `31070` HTTP API
* `31071` Graphite
