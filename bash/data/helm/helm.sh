#!/bin/bash

helm repo add harbor https://helm.goharbor.io
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo add kiali https://kiali.org/helm-charts
helm repo add jenkins https://charts.jenkins.io
helm repo add argocd https://argoproj.github.io/argo-helm
helm repo add jetstack https://charts.jetstack.io
helm repo add elastic https://helm.elastic.co
helm repo add secrets https://charts.external-secrets.io
helm repo add fluent https://fluent.github.io/helm-charts
helm repo add strimzi https://strimzi.io/charts
helm repo add kakfa https://provectus.github.io/kafka-ui-charts
helm repo add kong https://charts.konghq.com
helm repo add vault https://helm.releases.hashicorp.com
helm repo add consul https://helm.releases.hashicorp.com
helm repo add bitnami oci://registry-1.docker.io/bitnamicharts
helm repo add karpenter oci://public.ecr.aws/karpenter/karpenter
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
