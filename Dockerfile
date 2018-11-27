FROM openjdk:8-jre-alpine
USER root
ENV H2DIR=/opt/h2 \
    H2VERS=1.3.176 \
    H2DATA=/opt/h2-data \
    H2CONF=/opt/h2-conf \
    H2URL=http://www.h2database.com/h2-2018-03-18.zip

ADD h2-start.sh /tmp/

RUN apk --update add --no-cache curl \
    && mkdir -p ${H2CONF} ${H2DATA}/data \
    && adduser -D -h ${H2DATA}/data -s /sbin/nologin -u 2000 h2 \
    && curl -L $H2URL -o /tmp/h2.zip \
    && unzip -q /tmp/h2.zip -d /opt/ \
    && rm /tmp/h2.zip \
    && mv /tmp/h2-start.sh ${H2DIR}/bin \
    && chmod 755 ${H2DIR}/bin/h2-start.sh  ${H2DIR}/bin/h2.sh \
    && chown -R h2:h2 /opt/h2*

USER h2
WORKDIR ${H2DIR}
VOLUME ${H2DATA}
EXPOSE 8181 1521 5435
CMD ["/opt/h2/bin/h2-start.sh"]
