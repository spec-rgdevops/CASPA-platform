# Kieker Monitoring Server

`activemq-kls.yml` deploys two services:
* ActiveMQ which collects monitoring data from the instrumented application
* Kieker Logging Server (KLS) which reads monitoring data from ActiveMQ and writes them to
  * File system and/or
  * InfluxDB

## Deployment
Kieker Monitoring Server can be deployed by executing
* ```kubectl create -f https://raw.githubusercontent.com/spec-rgdevops/CASPA-platform/master/monitoring/kieker/activemq-kls.yaml```

## Exposed ports
When deployed, the following ports are exposed on Kubernetes cluster nodes:
* `31010` ActiveMQ http
* `31011` ActiveMQ tcp
* `31012` ActiveMQ stomp
* `31020` KLS http

## Configuration
KLS can be configured by changing environment variables in the yaml file. The details of how to configure KLS can be found [here](https://github.com/kieker-monitoring-docker/kieker-logging-server).
