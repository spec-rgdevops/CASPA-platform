# Sock Shop

Sock Shop is a microservices demo platform which simulates a basic web shop selling socks.
It consists out of 19 open-source microservices whose repositories can be found [here](https://github.com/microservices-demo)

## Deployment
Sock Shop can be deployed by executing the following steps on the master node:

1. Clone the repository
   ```git clone https://github.com/microservices-demo/microservices-demo```

2. Setup the sock shop
   1. ```cd microservices-demo```
   1. ```kubectl create -f deploy/kubernetes/manifests-logging```
   1. ```kubectl create -f deploy/kubernetes/manifests/sock-shop-ns.yaml -f deploy/kubernetes/manifests```

After a few minutes the pods should all be running and the sock shop can be opened.

The deployment includes:
* The Sock Shop application
* Two services providing basic load on the system (namespace load-test)
* Partial implementation opentraces with zipkin

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `30001` Sock Shop Front-End
* `31002` Zipkin Opentraces
