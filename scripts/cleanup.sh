#!/bin/bash

echo "🧹 Iniciando limpeza do ambiente Kubernetes..."

# Removendo aplicações
echo "📦 Removendo aplicações..."
kubectl delete -f manifests/bookinfo/bookinfo.yaml -n bookinfo --ignore-not-found=true
kubectl delete -f manifests/istio/virtualservice.yaml --ignore-not-found=true
kubectl delete -f manifests/istio/gateway.yaml --ignore-not-found=true

# Removendo ferramentas de monitoramento
echo "📊 Removendo ferramentas de monitoramento..."
kubectl delete -f manifests/monitoring/kiali.yaml --ignore-not-found=true
kubectl delete -f manifests/monitoring/prometheus.yaml --ignore-not-found=true

# Removendo Istio
echo "🔧 Desinstalando Istio..."
istioctl uninstall --purge -y

# Removendo namespaces
echo "🗑️ Removendo namespaces..."
kubectl delete namespace istio-system --ignore-not-found=true
kubectl delete namespace bookinfo --ignore-not-found=true

# Limpeza adicional
echo "🧼 Realizando limpeza adicional..."
kubectl delete mutatingwebhookconfiguration istio-sidecar-injector --ignore-not-found=true
kubectl delete -f manifests/namespace/namespaces.yaml --ignore-not-found=true

# Verificando se todos os recursos foram removidos
echo "🔍 Verificando recursos remanescentes..."
kubectl get pods -A | grep -E 'istio|bookinfo'
kubectl get services -A | grep -E 'istio|bookinfo'
kubectl get virtualservices -A
kubectl get gateways -A

echo "✨ Limpeza concluída! O ambiente está zerado." 