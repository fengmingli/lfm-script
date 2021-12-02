#!/bin/bash
VERSION="1.0.0"
IMAGE="lifengming/base"
docker build -t "$IMAGE:$VERSION" .
docker push "$IMAGE:$VERSION"



