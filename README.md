docker-pgrestapi
================

Sets up [PGRestAPI](https://github.com/spatialdev/PGRestAPI) in a docker container

Edit config/settings.js.example with your database connection settings

Download the pre-built docker image
---
```
docker pull noahg/docker-pgrestapi
```


Or, build the image from the Dockerfile
---------
Note: this is not necessary if you ran docker pull noahg/docker-pgrestapi
```
git clone https://github.com/noahg/docker-pgrestapi.git
docker build -t="noahg/docker-pgrestapi" docker-pgrestapi/
```

Run the container daemonized
---------
```
docker run -d -p 3001:3001 -i noahg/docker-pgrestapi
```
Try hitting: http://[boot2docker_ip_address]:3001


If needed, enter the container to debug and run manually
---------
```
docker run -p 3001:3001 -t -i noahg/docker-pgrestapi /bin/bash
node app.js
```