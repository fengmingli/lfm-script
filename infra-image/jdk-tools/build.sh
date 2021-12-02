#!/bin/bash
VERSION="1.0.0-redhat"
IMAGE="lifengming/java-tools"
docker build -t "$IMAGE:$VERSION" .
