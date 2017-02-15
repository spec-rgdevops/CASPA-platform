# kubernetes-recipes-rss

Configuration files for deploying [RSS Recipes](https://github.com/hora-prediction/recipes-rss-kube) on Kubernetes.

# System requirements
* A Kubernetes cluster
   * [minikube](https://github.com/kubernetes/minikube) on a local machine or
   * [Physical/virtual cluster](https://kubernetes.io/docs/getting-started-guides/)

# How to deploy RSS Recipes

RSS Recipes can be deployed by executing the following steps on the master node:

1. Deploy ActiveMQ server
   * ```kubectl create -f https://raw.githubusercontent.com/hora-prediction/kubernetes-recipes-rss/master/activemq.yaml```
1. Deploy Kieker Logging Server
   * ```kubectl create -f https://raw.githubusercontent.com/hora-prediction/kubernetes-recipes-rss/master/kls.yaml```
1. Deploy RSS Recipes application
   * ```kubectl create -f https://raw.githubusercontent.com/hora-prediction/kubernetes-recipes-rss/master/rssreader.yaml``` for the application without instrumentation or
   * ```kubectl create -f https://raw.githubusercontent.com/hora-prediction/kubernetes-recipes-rss/master/rssreader-kieker.yaml``` for the application instrumented with [Kieker](http://kieker-monitoring.net/)
1. Initialize cassandra keyspace
   * ```curl -s https://raw.githubusercontent.com/hora-prediction/kubernetes-recipes-rss/master/initialize-cassandra.cql -o initialize-cassandra.cql```
   * ```kubectl cp initialize-cassandra.cql $(kubectl get po | grep ^cassandra- | head -n 1 | cut -d ' ' -f1):/.```
   * ```kubectl exec $(kubectl get po | grep ^cassandra- | head -n 1 | cut -d ' ' -f1) -- cqlsh -f /initialize-cassandra.cql $(kubectl get nodes | head -n 2 | tail -n 1 | cut -d ' ' -f1) 31002``` Note: This step may need to be executed many times until it returns success.
1. Deploy [Locust](http://locust.io/) for load testing
   * ```kubectl create -f https://raw.githubusercontent.com/hora-prediction/kubernetes-recipes-rss/master/locust-master.yaml```
   * ```kubectl create -f https://raw.githubusercontent.com/hora-prediction/kubernetes-recipes-rss/master/locust-worker.yaml```
   
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
