#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push jtschichold/minemeld:"$TRAVIS_BRANCH"
