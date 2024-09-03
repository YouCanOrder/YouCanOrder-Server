#!/bin/bash

DOCKER_TAG=$(aws ssm get-parameter --name "/youcanorder/DOCKER_TAG" --query "Parameter.Value" --output text)

aws ecr get-login-password --region "$AWS_REGION" | docker login --username AWS --password-stdin "$ECR_URI"

docker pull "$DOCKER_TAG":latest

docker run -d --name youcanorder-server \
  "DOCKER_TAG":latest