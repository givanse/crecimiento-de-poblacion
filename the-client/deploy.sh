#!/bin/bash

set -e

git init
heroku git:remote -a apple-pen
git add .
git commit -m 'deploy'
git push heroku master

exit 0
