1-build
------------------

APP=blue ; docker build . -t talesmorais/$APP --build-arg app=$APP
APP=red  ; docker build . -t talesmorais/$APP --build-arg app=$APP

docker run -d -p 8080:80 talesmorais/blue
docker run -d -p 9090:80 talesmorais/red

http://localhost:8080/
http://localhost:9090/


2-deploy_on_k8s
------------------

Criar k8s
    k3d cluster create
    kubectl get node

1-deployment.yaml
    Aplicar
        kubectl apply -f 1-deployment.yaml
    Exibir pods criados
        kubectl get pod
    Filtrar por label
        kubectl get pod -l app=blue
    Acessar pod
        kubectl port-forward $(kubectl get pod -l app=blue -o name) 8080:80
        http://localhost:8080/
        kubectl port-forward $(kubectl get pod -l app=red -o name) 8080:80
        http://localhost:8080/


2-svc.yaml
    Aplicar
        kubectl apply -f 2-svc.yaml
    Exibir svc criados
        kubectl get svc
    Exibir tudo do BLUE
        kubectl get all -l app=blue
    Escalar deployment
        kubectl scale deploy/blue --replicas=5
        kubectl get deploy
        kubectl port-forward $(kubectl get svc -l app=blue -o name) 8080:80
        http://localhost:8080/
    Matar pod que foi acessado
        kubectl delete pod <ID>
    Quantidade reestabelecida
        kubectl get deploy
    Acesso a novo pod (sem alterar o ip acessado)
        kubectl port-forward $(kubectl get svc -l app=blue -o name) 8080:80

    Service colors
        Voltar deploys
            kubectl scale deploy/blue --replicas=1
            kubectl get pods
        Descomentar svc colors
        Aplicar 
            kubectl apply -f 2-svc.yaml
        Exibir svc criado
            kubectl get all -l group=color

3-ingress.yaml
    Aplicar
        kubectl apply -f 3-ingress.yaml
    Exibir tudo do group=color
        kubectl get all,ing -l group=color
        Traefik como CNI padrão
        host acessável
    Acessar aplicação de fora do cluster
        Altera arquivo hosts
            vim /mnt/c/Windows/System32/drivers/etc/hosts
            colocar tales.com
        links2 -g tales.com
    Alterar ingress
        Apontar ing para svc color
        kubectl apply -f 3-ingress.yaml
        links2 -g tales.com
        kubectl scale deploy/blue --replicas=0
        links2 -g tales.com

4-configmap.yaml
    Acessa pod
        kubectl exec -it $(kubectl get pod -l app=red -o name) -- /bin/sh
    Mostra sem variavel
        env | grep  config
    Descomentar codigo no deployment do red
    Aplicar    
        kubectl apply -f 4-configmap.yaml
    Reaplicar pods
        kubectl apply -f 1-deployment.yaml
    Acessa pod
        kubectl exec -it $(kubectl get pod -l app=red -o name) -- /bin/sh
    Mostra COM variavel
        env | grep  config
    









K8s up and running
    Principais early commiters do K8S
        Brendan Burns - MS Azure
        Joe Beda - VM Ware
        Kelsey Hightower - Google

Como fazer um pod pegar a alteração feita em um configmap?

hpa que verifique utilização de recursos para o deploy


helm
