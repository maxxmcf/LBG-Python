#!/bin/bash

#always get most up to date image!
#version=$(($version + 1))

#docker build -t maxmcf13/maxflask:v${version} .
#docker tag maxmcf13/maxflask:v${version} maxmcf13/maxflask

docker build -t maxmcf13/maxflask .

docker stop max-app \
&& (docker rm max-app) \
|| (docker rm max-app && sleep1  || sleep 1)

docker run -d -p 80:8081 --name max-app maxmcf13/maxflask