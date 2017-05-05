# Workload for RSS Reader

[Locust](http://locust.io/) is used as a workload generator for the RSS reader application.

## Deployment
Locust can be deployed by executing the following steps on the master node:
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/application/rssreader/workload/locust.yaml```

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `31050` Locust web interface
* `31051` Locust master p1
* `31052` Locust master p2
