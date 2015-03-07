#
# PGRestAPI container
#
FROM ubuntu:14.04
MAINTAINER Noah Glusenkamp <noah@empowerengine.com>

# Configure locales
RUN dpkg-reconfigure locales && \
      locale-gen en_US.UTF-8 && \
      update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Update apt
RUN apt-get update -y && \
      apt-get upgrade -y

# Install Nodejs dependencies
RUN apt-get install -y g++ curl libssl-dev apache2-utils git-core make

# Install Nodejs
RUN apt-get install -y -q software-properties-common && \
      add-apt-repository -y ppa:chris-lea/node.js  && \
      apt-get update -y && \
      apt-get install -y nodejs

# Install Mapnik
RUN add-apt-repository -y ppa:mapnik/nightly-2.3 && \
      apt-get update -y && \
      apt-get install -y libmapnik libmapnik-dev mapnik-utils python-mapnik
      
# also install datasource plugins if you need them    
RUN apt-get install -y mapnik-input-plugin-gdal mapnik-input-plugin-postgis

#Install Forever
RUN npm install -g forever

#Install PGRestAPI
RUN git clone https://github.com/spatialdev/PGRestAPI.git && \
      cd PGRestAPI && npm install

# Copy in PGRestAPI configuration file
ADD /config/settings.js.example /PGRestAPI/settings/settings.js

#Open port
EXPOSE 3001

#CMD ["/usr/bin/forever", "start", "/PGRestAPI/app.js"]
#CMD ["/usr/bin/node", "/PGRestAPI/app.js"]