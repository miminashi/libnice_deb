#!/bin/sh

IMAGE_NAME="libnice_deb"
CONTAINER_NAME="libnice_deb"

if [ -n "$(docker ps -q -f name=${CONTAINER_NAME})" ]; then
  docker rm ${CONTAINER_NAME}
fi &&
docker build -t ${IMAGE_NAME} . &&
docker run -it --name ${CONTAINER_NAME} ${IMAGE_NAME} sh -c "cd libnice-0.1.16 && debuild -rfakeroot -uc -us" &&
mkdir -p ./build &&
docker cp ${CONTAINER_NAME}:/work/libnice10_0.1.16-1_amd64.deb ./build/ &&
echo "build complete!"
