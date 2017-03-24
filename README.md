# A Platform for Comparability of Architecture-based Software Performance Engineering Approaches

Setting up an experimental evaluation for architecture-based Software Performance Engineering (SPE) approaches requires enormous efforts. This includes the selection and installation of representative applications, usage profiles, supporting tools, infrastructures, etc. Quantitative comparisons with related approaches are hardly possible due to limited repeatability of previous experiments by other researchers.

CASPA is a ready-to-use and extensible evaluation platform that already includes example applications and state-of-the-art SPE components, such as monitoring and model extraction. The platform explicitly provides interfaces to replace applications and components by custom(ized) components. The platform builds on state-of-the-art technologies such as container-based virtualization.

## Infrastructure layer
* A Kubernetes cluster can be setup either on a local machine or in a cloud environment:
   * [minikube](https://github.com/kubernetes/minikube) for setting up on a local machine
   * [Physical/virtual cluster](https://kubernetes.io/docs/getting-started-guides/) for setting up in a cloud environment

## Application layer
* RSS Reader
* [CoCoME](https://github.com/cocome-community-case-study/cocome-cloud-jee-docker)
* [SPECjEnterprise](https://github.com/spec-rgdevops/docker-SPECjEnterprise2010)

## Workload layer
The workload generator is appliclation-specific and can be found in the corresponding application directory.

## Monitoring layer
* Kieker Monitoring Server
* [inspectIT](https://github.com/inspectit-docker)

## Analysis layer
* Hora
* PMX
* [iObserve](https://github.com/research-iobserve/docker-images)
