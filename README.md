docker-pgrestapi
================

Sets up [PGRestAPI](https://github.com/spatialdev/PGRestAPI) in a docker container

> PGRestAPI is a Node.js REST API for PostgreSQL Spatial Tables.

Edit config/settings.js.example with your database connection settings


1. Download or build the image
----------

Download the pre-built docker image

```
docker pull noahg/docker-pgrestapi
```

or build the image from the Dockerfile

```
git clone https://github.com/noahg/docker-pgrestapi.git
docker build -t="noahg/docker-pgrestapi" docker-pgrestapi/
```

2. Run the container daemonized
---------
```
docker run -d -p 3001:3001 -i noahg/docker-pgrestapi
```
Try hitting: http://[boot2docker_ip_address]:3001


Helpful stuff
--------
Get container name and check logs:
```
docker ps
docker logs [container name]
```
If needed, enter the container to debug and run manually
```
docker run -p 3001:3001 -t -i noahg/docker-pgrestapi /bin/bash
node app.js
```