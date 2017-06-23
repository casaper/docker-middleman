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

if [ "$1" == "kill" ]; then
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

dumpAlias ()
{
  if (grep "$(echo $1 | cut -d '=' -f 1)" "$2" > /dev/null); then
    echo "«$1» is allready in the file, so it is skipped."
  else
    echo "$1" >> "$2"
  fi
}


if [ "$1" == "aliases" ]; then
  if [ -z "$2" ]; then
    echo "need to provide shell config to dump aliases into!"
    exit 1
  fi
  if ! [ -f "$2" ]; then
    echo "target config file doesn't exist"
    exit 1
  fi
  dumpAlias "alias middle-start='sh -c \"docker-compose start || docker-compose up\"'" "$2"
  dumpAlias "alias middle-stop='docker-compose stop'" "$2"
  dumpAlias "alias middle-pause='docker-compose pause'" "$2"
  dumpAlias "alias middle-resume='docker-compose unpause'" "$2"
  dumpAlias "alias middle-status='docker-compose ps'" "$2"
  dumpAlias "alias middle-build='docker-compose exec middleman bundle exec middleman build'" "$2"
  dumpAlias "alias middle-bash='docker-compose exec middleman bash'" "$2"
  dumpAlias "alias middle-logs='docker-compose logs middleman'" "$2"
  dumpAlias "alias middle-gulp='docker-compose exec middleman node_modules/.bin/gulp'" "$2"
  dumpAlias "alias middle-bundle='docker-compose exec middleman bundle'" "$2"
  dumpAlias "alias middle-yarn='docker-compose exec middleman yarn'" "$2"
  exit 0
fi

echo "Usage:"
echo "./run.sh aliases ~/path/configfile - dump a bunch of alliases to you're BASH or ZSH config file"
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
