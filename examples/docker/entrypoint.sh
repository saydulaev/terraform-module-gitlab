#!/bin/bash

function down() {
    docker compose down
    rm -rf gitlab-server/{config,data,logs}
}

function up() {
    mkdir gitlab-server/{config,data,logs}
    docker compose up -d
}

case "$1" in
    down)
        down
        ;;
    up)
        up
        ;;
    *)
        echo "Not recognize argument. Must be only 'up' and 'down'"
        ;;
esac

# export GITLAB_TOKEN=glpat-XXXXXXXX