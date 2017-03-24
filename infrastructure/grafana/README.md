# Grafana

Grafana is used to visualize collected data.

## Deployment
Grafana can be deployed by executing:
* ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/infrastructure/grafana/grafana.yaml```

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `31060` Web interface
