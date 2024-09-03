#!/bin/bash

DOCKER_TAG=$(aws ssm get-parameter --name "/youcanorder/DOCKER_TAG" --query "Parameter.Value" --output text)

docker run -d --name youcanorder-server \
  "DOCKER_TAG":latest