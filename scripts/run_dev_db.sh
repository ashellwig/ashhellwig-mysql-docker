#!/bin/bash

function build_dev() {
  docker build -t ashhellwig-postgres-dev-0 "${PWD}"
}

function run_dev_fg() {
  docker run --rm -P --name ashhellwig-postgres-0 ashhellwig-postgres-dev-0
}

function run_dev_fg_persistent() {
  docker run --rm --volumes-from ashhellwig-postgres-0 -t -i busybox sh
}
