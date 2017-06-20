#!/bin/bash
export LANG=C.UTF-8
export LANGUAGE=C.UTF-8
export LC_ALL=C.UTF-8
bundle
cd "/middleman/app" || exit 1
type gulp || yarn global add gulp
yarn install
node_modules/gulp/bin/gulp.js
bundle exec middleman server
