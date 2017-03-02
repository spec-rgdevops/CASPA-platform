# A Platform for Comparability of Architecture-based Software Performance Engineering Approaches

## Infrastructure layer
* A Kubernetes cluster can be setup either on a local machine or in a cloud environment:
   * [minikube](https://github.com/kubernetes/minikube) for setting up on a local machine
   * [Physical/virtual cluster](https://kubernetes.io/docs/getting-started-guides/) for setting up in a cloud environment

## Application layer

### RSS Recipes

RSS Recipes can be deployed by executing the following steps on the master node:

* Deploy RSS Recipes application
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/rssreader.yaml``` for the application without instrumentation or
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/rssreader-kieker.yaml``` for the application instrumented with [Kieker](http://kieker-monitoring.net/)
* Initialize cassandra keyspace
   * ```curl -s https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/initialize-cassandra.cql -o initialize-cassandra.cql```
   * ```kubectl cp initialize-cassandra.cql $(kubectl get po | grep ^cassandra- | head -n 1 | cut -d ' ' -f1):/.```
   * ```kubectl exec $(kubectl get po | grep ^cassandra- | head -n 1 | cut -d ' ' -f1) -- cqlsh -f /initialize-cassandra.cql $(kubectl get nodes | head -n 2 | tail -n 1 | cut -d ' ' -f1) 31002```
   
### CoCoME

The instruction to setup CoCoME can be found [here](https://github.com/cocome-community-case-study/cocome-cloud-jee-docker)
   
## Monitoring layer
### Kieker monitoring server

1. Deploy ActiveMQ server
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/activemq.yaml```
1. Deploy Kieker Logging Server
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/kls.yaml```

## Workload layer

* Deploy [Locust](http://locust.io/) for load testing
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/locust-master.yaml```
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/locust-worker.yaml```

## Running the experiment

After deploying all components, the following web-ui can be accessed:
* For minikube
   * RSS Recipes
      * http://192.168.99.100:31000/jsp/rss.jsp
   * Locust
      * http://192.168.99.100:31050
   * ActiveMQ
      * http://192.168.99.100:31010 (username: admin, password: admin)
   * Kieker monitoring log (available as a zip file)
      * http://192.168.99.100:31020/logs
* For physical/virtual cluster
   * Same as those for minikube but replace `192.168.99.100` with one of the node IPs. (Run `kubectl get nodes` to see the list of nodes)
