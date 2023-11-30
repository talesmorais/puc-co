#!/bin/bash -e

STUDENT=$1
cd jenkins
IMAGE_NAME="${STUDENT}/jenkins"
IMAGE_VERSION=`echo $(cat version)+1 | bc`
IMAGE_FULLNAME="$IMAGE_NAME:$IMAGE_VERSION"

# Docker
export DOCKER_BUILDKIT=1
docker build . -t $IMAGE_FULLNAME

# Update version file
echo $IMAGE_VERSION > version

echo -e "\n\nImage ${IMAGE_FULLNAME} builded."

docker run -p 8080:8080 ${IMAGE_FULLNAME}
