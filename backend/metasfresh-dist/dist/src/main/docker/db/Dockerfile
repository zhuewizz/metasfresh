
#
# The base image's to use can be set from outside using
# --build-arg BASE_IMAGE=<value>
#
# The default "latest" is usually the latest build from the release branch
# It is by our convention the same as "release-latest"
ARG BASE_IMAGE=nexus.metasfresh.com:6001/metasfresh/metasfresh-db-init-pg-9-5

FROM ${BASE_IMAGE}

RUN localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG=de_DE.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_MESSAGES=en_US.UTF-8

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["postgres"]
