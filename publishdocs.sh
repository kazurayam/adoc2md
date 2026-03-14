#!/bin/bash

cd ./docs; ./adoc2md.sh; cd -

git status
git add .
git commit -m "the docs"
git push

