# I. Docker images and containers

## 1. Pull a docker image from docker hub
$ docker pull postgres

## 2. Lunch a postgres docker container
$ docker run -e POSTGRES_PASSWORD=password postgres

## 3. Lunch an existing stopped docker container (will lunch in detached mode)
$ docker start ***stopped-container-(name/id)***

## 4. See the logs of a container
$ docker logs ***container-name/id***

## 5. Follow a log in running
$ docker logs -f _(for --follow)_ ***container-name***

## 6. Run some commands inside a container in interactive mode
$ docker exec -it ***container-name*** ***options***
- Example: $ docker exec -it vigorous_lumiere psql -U postgres

## 7. Rename a container
$ docker run --name ***new-name*** -e POSTGRES_PASSWORD=password postgres

## 8. Run in detached mode
$ docker run -d _(for --detached)_ --name ***new-name*** -e POSTGRES_PASSWORD=password postgres

# II. Docker volumes

## 1. Mount a container in a volume
$ docker run --name postgresql-dev -e POSTGRES_PASSWORD=password -v 
    ***volume-location-in-your-host-machine***:***image-volume-location-or-path***
- Example: $ docker run --name postgresql-dev -e POSTGRES_PASSWORD=password -v 
    `/xxxxxx/virtualisation/docker-demo/volumes/postgres/data`:/var/lib/postgres/data postgres

## 2. Create an anonymous volume
- We let docker create a default path for us.
- Example: $ docker run --name postgresql-dev -e POSTGRES_PASSWORD=password -v /var/lib/postgres/data postgres

# III. Docker in real life

## 1. Expose some ports
$ docker run --name postgresql-dev `-p 5432(host port):5432(container port)` -d -e POSTGRES_PASSWORD=password -v 
    /home/devjunior/Bureau/Projects/virtualisation/docker-demo/volumes/postgres/data:/var/lib/postgres/data postgres

## 2. Dockerfile: packaging a Spring Boot application
- Builder un Dockerfile
$ docker build -t jpa/demo .

## 3. Docker network
- We have two containers who must communicate via a database connexin.
- The first container is a Spring Boot application
- The second is the database.
- To communicate these two application, we need to create a network
    between them.

1. Create a network
$ docker network create `network-name`

2. Connect a running container to a new network
$ docker network connect `network-name` `running-container-name`

3. Connect a container to a network at its starting
$ docker run --net `network-name` `image-name`

## 4. Summary
Thus, there are three (03) to build and run a Spring Boot image
1. Generate the jar of the project
    $ ./mvnw clean package 

2. Build the image
    $ docker build -t jpa/demo .

3. Run the image
    $ docker run -p 8082:8080 --net jpa-net jpa/demo

4. A complete commande
 $ docker run --name postgresql-prod -p 1234:5432 -d 
 -e POSTGRES_PASSWORD=password 
 -e POSTGRES_USER=username 
 -e POSTGRES_DB=docker_db_demo 
 -v /home/devjunior/Bureau/Projects/virtualisation/docker-demo/volumes/postgres/data:/var/lib/postgres/data 
 postgres













