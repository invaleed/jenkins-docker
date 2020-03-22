#!/bin/bash

# Tag then existing version case "old"
docker tag carboni.io/jenkins carboni.io/jenkins:old

# Build then image
docker build --no-cache --tag=carboni.io/jenkins .
docker push carboni.io/jenkins

# Delete the old image
docker rmi carboni.io/jenkins:old