FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends wget gnupg2 ca-certificates

RUN echo "deb http://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update && apt-get install -y --no-install-recommends wget postgresql-client-16 mariadb-client python3 python3-pip less libsodium-dev tmux && rm -rf /var/lib/apt/lists/*

RUN pip3 install pg_activity psycopg2-binary pgcli docker

RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc && chmod +x mc

ADD lhc lhc


ENTRYPOINT ["./lhc"]
