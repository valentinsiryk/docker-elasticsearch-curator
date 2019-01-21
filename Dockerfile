FROM alpine:3.6

RUN apk --no-cache add \
        python \
        py-setuptools \
        py-pip \
        gcc \
        libffi \
        py-cffi \
        python-dev \
        libffi-dev \
        py-openssl \
        musl-dev \
        linux-headers \
        openssl-dev \
        libssl1.0 \
 && pip install \
        elasticsearch-curator==5.5.4 \
        boto3==1.4.8 \
        requests-aws4auth==0.9 \
        cryptography==2.1.3 \
 && apk del \
        py-pip \
        gcc \
        python-dev \
        libffi-dev \
        musl-dev \
        linux-headers \
        openssl-dev

RUN sed -i '/import sys/a urllib3.contrib.pyopenssl.inject_into_urllib3()' /usr/bin/curator \
    && sed -i '/import sys/a import urllib3.contrib.pyopenssl' /usr/bin/curator \
    && sed -i '/import sys/a import urllib3' /usr/bin/curator

COPY curator.yml action.yml /

RUN echo "5 0 * * *     /usr/bin/curator --config /curator.yml /action.yml" >> /etc/crontabs/root

CMD ["/usr/sbin/crond","-c","/etc/crontabs","-f","-l","8"]

