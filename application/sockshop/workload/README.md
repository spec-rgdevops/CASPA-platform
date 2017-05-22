# Workload for Sock Shop

[Locust](http://locust.io/) is used as a workload generator for the Sock Shop.
By default two locust services put a basic load on the system.
There's no web interface for those two services and they somehow lack controllability.
We therefore setup a different locust microservice with the default web UI.

## Deployment
Locust can be deployed by executing the following steps on the master node:
   * delete the existing load setup
   ```kubectl delete pods,services,deployments --all --namespace=load-test```
   * setup the new locust microservice
   ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/application/sockshop/workload/locust.yaml```

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `31050` Locust web interface
* `31051` Locust master p1
* `31052` Locust master p2
