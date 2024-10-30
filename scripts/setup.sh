#!/bin/bash

# Criar namespaces
kubectl apply -f manifests/namespace/namespaces.yaml

# Instalar Istio
istioctl install --set profile=demo -y

# Instalar Bookinfo
kubectl apply -f manifests/bookinfo/bookinfo.yaml -n bookinfo

# Configurar Gateway e VirtualService
kubectl apply -f manifests/istio/gateway.yaml
kubectl apply -f manifests/istio/virtualservice.yaml

# Instalar ferramentas de monitoramento
kubectl apply -f manifests/monitoring/kiali.yaml
kubectl apply -f manifests/monitoring/prometheus.yaml

# Verificar status
kubectl get pods -n istio-system
kubectl get pods -n bookinfo 