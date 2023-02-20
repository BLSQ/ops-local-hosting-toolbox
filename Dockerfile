FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends wget postgresql-client-14 mariadb-client python3 python3-pip less libsodium-dev tmux && rm -rf /var/lib/apt/lists/*

RUN pip3 install pg_activity psycopg2-binary pgcli docker

RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc && chmod +x mc

ADD lhc lhc


ENTRYPOINT ["./lhc"]
