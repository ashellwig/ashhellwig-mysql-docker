# Dockerfile (Development)
# Description: Dockerfile for Development Grade Database (PostgreSQL)
# Author: Ash Hellwig <ahellwig.dev@gmail.com>
#
# Source: https://docs.docker.com/engine/examples/postgresql_service/

FROM ubuntu:20.10

RUN apt-get update \
  && apt-get upgrade -y \
  && apt install gnupg pbuilder ubuntu-dev-tools apt-file -y && apt-get install gnupg -y

RUN apt-key \
  adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
  --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 \
  && echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > \
    /etc/apt/sources.list.d/pgdg.list

USER postgres

RUN /etc/init.d/postgresql \
  && psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" \
  && createdb -O docker docker

RUN echo "host all  all    0.0.0.0/0  md5" >> \
  /etc/postgresql/9.3/main/pg_hba.conf

VOLUME ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
