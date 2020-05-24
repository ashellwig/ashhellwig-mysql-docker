# Dockerfile (Development)
# Description: Dockerfile for Development Grade Database (PostgreSQL)
# Author: Ash Hellwig <ahellwig.dev@gmail.com>
#
# Source: https://docs.docker.com/engine/examples/postgresql_service/

FROM ubuntu:20.10

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
