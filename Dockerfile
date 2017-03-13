# base CoMSES postgis Dockerfile
FROM postgres:9.5
MAINTAINER CoMSES Net <dev@comses.net>

ENV COMSES_UID=2718 \
    COMSES_USER=comses \
    DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    POSTGIS_MAJOR=2.3 \
    POSTGIS_VERSION=2.3.2+dfsg-1~exp1.pgdg80+1

RUN useradd -m --uid $COMSES_UID $COMSES_USER && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
    postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts=$POSTGIS_VERSION \
    postgis=$POSTGIS_VERSION && \
    mkdir -p /docker-entrypoint-initdb.d && \
    rm -rf /var/lib/apt/lists/* 

COPY scripts/init-postgis.sh /docker-entrypoint-initdb.d/
