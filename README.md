docker-pgrestapi
================

Sets up [PGRestAPI](https://github.com/spatialdev/PGRestAPI) in a docker container

> PGRestAPI is a Node.js REST API for PostgreSQL Spatial Tables.


1. Clone this repo
----------

```
git clone https://github.com/noahg/docker-pgrestapi.git
```

2. Configure database or add files
----------

PGRestAPI can serve static shapefiles, mbtiles files, or connect to a Postgres/PostGIS database.
Edit config/settings.js.example with your database settings and/or add some files into appropriate subdirectory under data/ (eg. data/shapefiles/)

*For security reasons, it is recommended that you use a READ ONLY PostGreSQL User.*

```
settings.pg.username = 'username';
settings.pg.password = 'password';
settings.pg.server = '127.0.0.1';
settings.pg.port = '5432';
settings.pg.database = 'test';
```

3. Build the container
--------

```
docker build -t="noahg/docker-pgrestapi" docker-pgrestapi/
```

4. Run the container daemonized
---------

```
docker run -d -p 3001:3001 -i noahg/docker-pgrestapi
```
Try hitting: http://[docker_ip_address]:3001

If you're using boot2docker on OS X, lookup your docker ip address with
```
boot2docker ip
```

Helpful stuff
--------
Get container name and check logs:
```
docker ps
docker logs [container name]
```
If needed, run the container in interactive mode with bash. Useful for debugging and running things manually.
```
docker run -p 3001:3001 -t -i noahg/docker-pgrestapi /bin/bash
node app.js
```