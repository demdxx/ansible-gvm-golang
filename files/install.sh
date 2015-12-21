#!/usr/bin/env bash

set +x

echo "RUN"

function safemake {
  if [ "$?" != "0" ]; then
    echo "ERROR: BUILD FAILED"
    exit 1
  fi
}

source ~/.bash_profile

if [ -z "`which gvm`" ]; then

  echo "source \"$HOME/.gvm/scripts/gvm\"" >> ~/.bash_profile
  source ~/.bash_profile

fi

gvm install go1.4
safemake

gvm use go1.4 --default
safemake

if [ -z "$GOROOT_BOOTSTRAP" ]; then

  GO_PATH=`which go`
  BASE_GOPATH=`dirname $(dirname $GO_PATH)`

  echo "export GOROOT_BOOTSTRAP='$BASE_GOPATH'" >> ~/.bash_profile

fi
