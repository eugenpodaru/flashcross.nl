#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR

rm -rf output_prod
git clone -b gh-pages git@github.com:FlashcrossNL/flashcross.nl.git output_prod
rm -rf output_prod/*
sculpin generate --env=prod

cd output_prod
git add -A
git commit -m "Generating new version"
git push origin gh-pages
