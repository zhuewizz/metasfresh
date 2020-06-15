FROM postgres:9.5

MAINTAINER dev@metasfresh.com

# to make sure that the cache is only used during one day, run docker build --build-arg CACHEBUST=$(date "+%Y-%m-%d")
# that way we should get the latest updates since the release of our base image
# thx to https://github.com/moby/moby/issues/1996#issuecomment-185872769
ARG CACHEBUST=1

# directory from where the "vanilla" metasfresh data is copied into this container
#ARG DATA_DIR=./postgresql_data


RUN apt -y update \
    && apt -y upgrade \
    && apt -y autoremove \
    && apt -y clean

RUN localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG=de_DE.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_MESSAGES=en_US.UTF-8

COPY --chown=postgres:postgres postgresql_data_dir /var/lib/postgresql/
COPY --chown=postgres:postgres postgresql.conf /var/lib/postgresql/data/postgresql.conf

EXPOSE 5432
