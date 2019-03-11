#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
echo "Pushing jtschichold/minemeld:$TRAVIS_BRANCH"
docker push jtschichold/minemeld:"$TRAVIS_BRANCH"

if [[ -n "${TRAVIS_TAG}" ]]; then
    docker tag jtschichold/minemeld:"$TRAVIS_BRANCH" jtschichold/minemeld:"$TRAVIS_TAG"
    echo "Pushing jtschichold/minemeld:$TRAVIS_TAG"
    docker push jtschichold/minemeld:"$TRAVIS_TAG"

    if [ "$TRAVIS_BRANCH" == "master" ]; then
        docker tag jtschichold/minemeld:"$TRAVIS_BRANCH" jtschichold/minemeld:latest
        echo "Pushing jtschichold/minemeld:latest"
        docker push jtschichold/minemeld:latest
    fi
fi
