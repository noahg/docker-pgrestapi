docker-pgrestapi
================

Sets up [PGRestAPI](https://github.com/spatialdev/PGRestAPI) in a docker container

Edit config/settings.js.example with your database connection settings


How to build the container
---------
'''
git clone https://github.com/noahg/docker-pgrestapi.git
docker build -t="noahg/docker-pgrestapi" docker-pgrestapi/
'''

How to run the container:
---------
'''
docker run -d -p 3001:3001 -i noahg/docker-pgrestapi
'''
Try hitting http://{{ boot2docker_ip_address }}:3001


Enter the container to debug:
---------
'''
docker run -p 3001:3001 -t -i noahg/docker-pgrestapi /bin/bash
/usr/bin/node /PGRestAPI/app.js
'''