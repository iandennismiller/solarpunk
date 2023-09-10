#!/bin/bash

if [ -f source ~/.rvm/scripts/rvm ]; then
    source ~/.rvm/scripts/rvm
fi

echo "get dependencies"
bundle install --path vendor/bundle
echo "OK"
