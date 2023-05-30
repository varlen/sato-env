#!/bin/sh

set -x
docker container run -p 5000:5000 -v $(readlink -e $1):/sato -d sato-env:py3.9
