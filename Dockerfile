# base CoMSES postgis Dockerfile
FROM postgres:9.5
MAINTAINER CoMSES Net <dev@comses.net>
ENV PYTHONUNBUFFERED=1 \
            COMSES_UID=2718 \
            COMSES_USER=comses \
            LANG=C.UTF-8 \
            LC_ALL=C.UTF-8 \
            POSTGIS_VERSION=2.3 \
            DEBIAN_FRONTEND=noninteractive
RUN useradd -m --uid $COMSES_UID $COMSES_USER && \
            apt-get update && \
            apt-get install -y --no-install-recommends \
            postgresql-$PG_MAJOR-postgis-$POSTGIS_VERSION \
            postgis-$POSTGIS_VERSION && \
            rm -rf /var/lib/apt/lists/*
