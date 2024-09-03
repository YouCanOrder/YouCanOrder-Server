#!/bin/bash

AWS_REGION=$(aws ssm get-parameter --name "/youcanorder/AWS_REGION" --query "Parameter.Value" --output text)
ECR_URI=$(aws ssm get-parameter --name "/youcanorder/ECR_URI" --query "Parameter.Value" --output text)
DOCKER_TAG=$(aws ssm get-parameter --name "/youcanorder/DOCKER_TAG" --query "Parameter.Value" --output text)

aws ecr get-login-password --region "$AWS_REGION" | docker login --username AWS --password-stdin "$ECR_URI"

docker pull "$DOCKER_TAG":latest

docker run -d --name youcanorder-server \
  "DOCKER_TAG":latest