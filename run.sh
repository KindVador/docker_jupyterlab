#!/bin/bash

docker build -t jlab -f debian/python3.8/Dockerfile .
docker run -ti -v ${PWD}:/usr/local/bin/jlab -p 8888:8888 jlab