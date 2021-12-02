#!/bin/bash
VERSION="1.0.0"
IMAGE="lifengming/go-builder"
docker build -t "$IMAGE:$VERSION" .
docker push "$IMAGE:$VERSION"

