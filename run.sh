#!/bin/bash

if [ "$1" == "start" ]; then
  docker-compose start || docker-compose up
  exit 0
fi

if [ "$1" == "stop" ]; then
  docker-compose stop
  exit 0
fi

if [ "$1" == "pause" ]; then
  docker-compose pause
  exit 0
fi

if [ "$1" == "resume" ]; then
  docker-compose unpause
  exit 0
fi

if [ "$1" == "status" ]; then
  docker-compose ps
  exit 0
fi

if [ "$1" == "status" ]; then
  docker-compose kill middleman
  exit 0
fi

if [ "$1" == "build" ]; then
  docker-compose exec middleman sh -c 'bundle exec middleman build'
  exit 0
fi

if [ "$1" == "bash" ]; then
  docker-compose exec middleman bash
  exit 0
fi

if [ "$1" == "logs" ]; then
  docker-compose logs middleman
  exit 0
fi

if [ "$1" == "gulp" ]; then
  docker-compose exec middleman sh -c "node_modules/.bin/gulp ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}"
  exit 0
fi

if [ "$1" == "bundle" ]; then
  docker-compose exec middleman sh -c "bundle ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}"
  exit 0
fi

if [ "$1" == "yarn" ]; then
  docker-compose exec middleman sh -c "yarn ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}"
  exit 0
fi

echo "Usage:"
echo "./run.sh start - start or initially start the container"
echo "./run.sh stop - stop the running container"
echo "./run.sh pause - pause the container"
echo "./run.sh resume - resume the container from paused state"
echo "./run.sh kill - force stop the running container"
echo "./run.sh status - status display actual status of the conainer"
echo "./run.sh build - build middleman for deployment"
echo "./run.sh logs - display shell output from the container"
echo "./run.sh bash - enter bash prompt inside container"
echo "./run.sh gulp - run gulp command inside the container, eg. gulp scripts, gulp default, ..."
echo "./run.sh bundle - run bundle command inside the container, eg. bundle outdated, bundle update, ..."
echo "./run.sh yarn - run yarn inside the container, eg. yarn outdated, yarn add gulp-babel, ..."
exit 0
