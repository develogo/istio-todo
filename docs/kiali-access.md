# Guia de Acesso ao Kiali Dashboard

O Kiali é uma console de gerenciamento para o Istio Service Mesh que permite visualizar a topologia da sua malha de serviços, monitorar o tráfego e diagnosticar problemas.

## Acessando o Kiali

### 1. Verificar Status do Pod 

Primeiro, verifique se o pod do Kiali está em execução:
```bash
kubectl get pod -n istio-system | grep kiali
```

### 2. Port Forward

Para acessar o Kiali Dashboard localmente, execute o seguinte comando:
```bash
kubectl port-forward svc/kiali -n istio-system 20001:20001
```

### 3. Acessando o Dashboard

Após executar o port-forward, você pode acessar o Kiali Dashboard através do seu navegador:

1. Abra seu navegador
2. Acesse: `http://localhost:20001`
3. Faça login usando as credenciais configuradas

### 4. Autenticação

Por padrão, o Kiali pode usar diferentes métodos de autenticação:
- Token
- OpenID Connect
- Login/Senha (se configurado)

### 5. Navegação Básica

No Dashboard você encontrará:
- Graph: Visualização da topologia da malha
- Applications: Lista de aplicações
- Workloads: Cargas de trabalho
- Services: Serviços disponíveis
- Istio Config: Configurações do Istio

### 6. Troubleshooting

Se você não conseguir acessar o Kiali:

1. Verifique se o pod está rodando:
```bash
kubectl get pod -n istio-system | grep kiali
```

2. Verifique os logs:
```bash
kubectl logs -n istio-system $(kubectl get pod -n istio-system | grep kiali | awk '{print $1}')
```

3. Certifique-se que o Istio está instalado corretamente:
```bash
istioctl verify-install
```

## Dicas de Uso

- Use a visualização em grafo para entender o fluxo de tráfego
- Monitore a saúde dos serviços através dos indicadores de cores
- Verifique as métricas de latência e taxa de erro
- Utilize os filtros para focar em namespaces ou serviços específicos

## Referências

- [Documentação Oficial do Kiali](https://kiali.io/docs/)
- [Istio Documentation](https://istio.io/latest/docs/)