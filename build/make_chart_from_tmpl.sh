#!/bin/sh

if [ -z $1 ]; then
    echo "You must pass in the chart name as the first parameter"
    exit 1
fi

CHART_VER="$(git describe --tags --abbrev=0 | sed 's/^v//')"
CHART_REL="$(git rev-list --count v${CHART_VER}..HEAD)"

envsubst < build/Chart.yaml.in > $1/Chart.yaml
