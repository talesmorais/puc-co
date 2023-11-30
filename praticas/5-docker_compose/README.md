docker network create wp_net
docker network ls

docker container run --name wp-db -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress --network=wp_net -d mysql:8.0.30

docker container run --name wp-web -e WORDPRESS_DB_HOST=wp-db -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress --network=wp_net -p 8080:80 -d wordpress

docker container run --name wp-phpmyadmin -e PMA_HOST=wp-db -e PMA_PORT=3306 -e PMA_USER=wordpress -e PMA_PASSWORD=wordpress --network=wp_net -p 9090:80 -d phpmyadmin

docker container ls

http://localhost:8080
http://localhost:9090

(fazer o docker compose)

docker-compose up

(fazer o docker compose com variaveis)


docker-compose --env-file .env -f docker-compose2.yml up --force-recreate