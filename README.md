# A Platform for Comparability of Architecture-based Software Performance Engineering Approaches

Setting up an experimental evaluation for architecture-based Software Performance Engineering (SPE) approaches requires enormous efforts. This includes the selection and installation of representative applications, usage profiles, supporting tools, infrastructures, etc. Quantitative comparisons with related approaches are hardly possible due to limited repeatability of previous experiments by other researchers.

CASPA is a ready-to-use and extensible evaluation platform that already includes example applications and state-of-the-art SPE components, such as monitoring and model extraction. The platform explicitly provides interfaces to replace applications and components by custom(ized) components. The platform builds on state-of-the-art technologies such as container-based virtualization.

## Infrastructure layer
* A Kubernetes cluster can be setup either on a local machine or in a cloud environment:
   * [minikube](https://github.com/kubernetes/minikube) for setting up on a local machine
   * [Physical/virtual cluster](https://kubernetes.io/docs/getting-started-guides/) for setting up in a cloud environment

## Application layer
### RSS Reader

RSS Reader can be deployed by executing the following steps on the master node:

1. Deploy RSS Recipes application
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/rssreader.yaml``` for the application without instrumentation or
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/rssreader-kieker.yaml``` for the application instrumented with [Kieker](http://kieker-monitoring.net/)
1. Initialize cassandra keyspace
   1. ```curl -s https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/initialize-cassandra.cql -o initialize-cassandra.cql```
   1. ```kubectl cp initialize-cassandra.cql $(kubectl get po | grep ^cassandra- | head -n 1 | cut -d ' ' -f1):/.```
   1. ```kubectl exec $(kubectl get po | grep ^cassandra- | head -n 1 | cut -d ' ' -f1) -- cqlsh -f /initialize-cassandra.cql $(kubectl get nodes | head -n 2 | tail -n 1 | cut -d ' ' -f1) 31002```
   
### CoCoME

The instruction to setup CoCoME can be found [here](https://github.com/cocome-community-case-study/cocome-cloud-jee-docker)

### SPECjEnterprise

The instruction to setup SPECjEnterprise can be found [here] (https://github.com/spec-rgdevops/docker-SPECjEnterprise2010)
   
## Monitoring layer
### Kieker monitoring server

1. Deploy ActiveMQ server
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/activemq.yaml```
1. Deploy Kieker Logging Server
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/kls.yaml```

### inspectIT

The instruction to setup inspectIT can be found [here] (https://github.com/inspectit-docker)

## Workload layer

* Deploy [Locust](http://locust.io/) for load testing
   1. ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/locust-master.yaml```
   1. ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/locust-worker.yaml```

## Analysis layer

### PMX

### iObserve
The instruction to setup iObserve can be found [here](https://github.com/research-iobserve/docker-images)

## Running the experiment

After deploying all components, the following web-ui can be accessed:
* For minikube
   * RSS Reader
      * http://192.168.99.100:31000/jsp/rss.jsp
   * Locust
      * http://192.168.99.100:31050
   * ActiveMQ
      * http://192.168.99.100:31010 (username: admin, password: admin)
   * Kieker monitoring log (available as a zip file)
      * http://192.168.99.100:31020/logs
* For physical/virtual cluster
   * Same as those for minikube but replace `192.168.99.100` with one of the node IPs. (Run `kubectl get nodes` to see the list of nodes)
