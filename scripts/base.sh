#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -qq curl unzip git-core ack-grep

git config --global http.postBuffer 65536000