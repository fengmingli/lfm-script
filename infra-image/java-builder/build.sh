#!/bin/bash
VERSION="1.0.0"
IMAGE="lifengming/runtime"
sudo docker build -t "$IMAGE:$VERSION" .
sudo docker push "$IMAGE:$VERSION"

