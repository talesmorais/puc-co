PRE-REQUISITOS
    docker pull nginx
    docker pull nginx:1.24
    docker run nginx

COMANDOS
    docker image build .
    docker image inpect nginx
    docker images
    docker rmi <ID>
    docker rmi $(docker image ls -qa)
    docker image prune
