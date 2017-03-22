#!/bin/bash

wget -P ~ https://github.com/yeasy/docker_practice/raw/master/_local/.bashrc_docker;

cat >> ~/.bashrc_docker << EOF
function enterpoint() {
        if [ -z "\$1" ]; then
            echo "Usage: `basename "$0"` CONTAINER [COMMAND [ARG]...]"
            echo ""
            echo "Enters the Docker CONTAINER and executes the specified COMMAND."
            echo "If COMMAND is not specified, runs an interactive shell in CONTAINER."
        else
            docker-enter \`docker ps | awk '/'\$1'/{print \$1}'\`
        fi
}
EOF
echo "[ -f ~/.bashrc_docker ] && . ~/.bashrc_docker" >> ~/.bashrc; source ~/.bashrc

[ ! -d /data/www ] && mkdir -p /data/www
[ ! -d /data/mysql ] && mkdir -p /data/mysql
