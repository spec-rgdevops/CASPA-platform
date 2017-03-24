# A Platform for Comparability of Architecture-based Software Performance Engineering Approaches

Setting up an experimental evaluation for architecture-based Software Performance Engineering (SPE) approaches requires enormous efforts. This includes the selection and installation of representative applications, usage profiles, supporting tools, infrastructures, etc. Quantitative comparisons with related approaches are hardly possible due to limited repeatability of previous experiments by other researchers.

CASPA is a ready-to-use and extensible evaluation platform that already includes example applications and state-of-the-art SPE components, such as monitoring and model extraction. The platform explicitly provides interfaces to replace applications and components by custom(ized) components. The platform builds on state-of-the-art technologies such as container-based virtualization.

## Infrastructure layer
* A Kubernetes cluster can be set up either on a local machine or in a cloud environment:
   * [minikube](https://github.com/kubernetes/minikube) for setting up on a local machine
   * [Physical/virtual cluster](https://kubernetes.io/docs/getting-started-guides/) for setting up in a cloud environment
* [InfluxDB](https://github.com/spec-rgdevops/CASPA-platform/tree/master/infrastructure/influxdb)
* [Grafana](https://github.com/spec-rgdevops/CASPA-platform/tree/master/infrastructure/grafana)
* [Kubernetes addons](https://github.com/spec-rgdevops/CASPA-platform/tree/master/infrastructure/k8s-addons)

## Application layer
* [RSS Reader](https://github.com/spec-rgdevops/CASPA-platform/tree/master/application/rssreader)
* [CoCoME](https://github.com/cocome-community-case-study/cocome-cloud-jee-docker)
* [SPECjEnterprise](https://github.com/spec-rgdevops/docker-SPECjEnterprise2010)

## Workload layer
The workload generator is appliclation-specific and can be found in the corresponding application directory.

## Monitoring layer
* [Kieker Monitoring Server](https://github.com/spec-rgdevops/CASPA-platform/tree/master/monitoring/kieker)
* [inspectIT](https://github.com/inspectit-docker)

## Analysis layer
* [Hora](https://github.com/spec-rgdevops/CASPA-platform/tree/master/analysis/hora)
* [ADMX](https://github.com/spec-rgdevops/CASPA-platform/tree/master/analysis/admx)
* [PMX](https://github.com/spec-rgdevops/CASPA-platform/tree/master/analysis/pmx)
* [iObserve](https://github.com/research-iobserve/docker-images)
