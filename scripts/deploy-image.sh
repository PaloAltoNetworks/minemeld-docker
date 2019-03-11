#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push jtschichold/minemeld:"$TRAVIS_BRANCH"

if [[ -z "${TRAVIS_TAG}" ]]; then
    docker tag jtschichold/minemeld:"$TRAVIS_BRANCH" jtschichold/minemeld:"$TRAVIS_TAG"
    docker push jtschichold/minemeld:"$TRAVIS_TAG"

    if [ "$TRAVIS_BRANCH" == "master" ]; then
        docker tag jtschichold/minemeld:"$TRAVIS_BRANCH" jtschichold/minemeld:latest
        docker push jtschichold/minemeld:latest
    fi
fi
