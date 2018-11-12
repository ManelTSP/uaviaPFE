#!/bin/bash
docker stop $(docker ps -aq)
docker-compose rm 
cd gateway
./mvnw package -Pprod jib:dockerBuild & 
cd ../microservice1
./mvnw package -Pprod jib:dockerBuild &
cd ../microservice2
./mvnw package -Pprod jib:dockerBuild &
cd ../microservice3
./mvnw package -Pprod jib:dockerBuild 

echo "Image creation completed"
