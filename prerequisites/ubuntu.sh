#!/bin/bash -e

sudo apt update && sudo apt install -y cargo golang-go git cmake nodejs npm
npm install yarn
yarn install 

