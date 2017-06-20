#!/bin/bash

# install brew if not present
type brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install cask
brew cask || brew tap caskroom/cask

# docker for mac
type docker || brew cask install docker
/Applications/Docker.app/Contents/MacOS/Docker &

type docker-compose || exit 1

docker-compose build

docker-compose up
