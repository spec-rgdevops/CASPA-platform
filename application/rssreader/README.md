# RSS Reader

RSS Reader is a Netflix application that demonstrates how Netflix Open Source components can be tied together.

This is a modified version of the RSS Recipes to make it suitable for deploying on Kubernetes. For information regarding the original application by Netflix, please visit https://github.com/Netflix/recipes-rss.

The repository of the modified version can be found [here](https://github.com/hora-prediction/recipes-rss-kube)

## Deployment
RSS Reader can be deployed by executing the following steps on the master node:

1. Deploy RSS Recipes application
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/application/rssreader/rssreader.yaml``` for the application without instrumentation or
   * ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/application/rssreader/rssreader-kieker.yaml``` for the application instrumented with [Kieker](http://kieker-monitoring.net/)
1. Initialize cassandra keyspace
   1. ```curl -s https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/application/rssreader/initialize-cassandra.cql -o initialize-cassandra.cql```
   1. ```kubectl cp initialize-cassandra.cql $(kubectl get po | grep ^cassandra- | head -n 1 | cut -d ' ' -f1):/.```
   1. ```kubectl exec $(kubectl get po | grep ^cassandra- | head -n 1 | cut -d ' ' -f1) -- cqlsh -f /initialize-cassandra.cql $(kubectl get nodes | head -n 2 | tail -n 1 | cut -d ' ' -f1) 31002```

The deployment includes:
* Edge
* Middletier
* Cassandra
* RSS server

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `31000` RSS reader web user interface
* `31001` Middletier REST API
* `31002` Cassandra CQL
* `31003` Cassandra Thrift
* `31004` RSS server
