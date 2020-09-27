FROM python:3.8-buster as builder

WORKDIR /tmp

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install pip -U \
  && pip3 install setuptools -U \
  && pip3 install babel nose

COPY . .

RUN python3 setup.py build \
    && python3 setup.py bdist_wheel \
    && ls -lR dist

FROM python:3.8-slim-buster

WORKDIR /tmp

ENV DEBIAN_FRONTEND noninteractive

COPY --from=builder /tmp/dist/*.whl .

RUN apt-get -y update \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install pip -U \
#  && pip3 install setuptools -U \
  && pip3 install *.whl \
  && rm ./*

WORKDIR /blog

RUN groupadd -r tinker \
    && useradd -r -s /bin/bash -g tinker tinker

USER tinker

CMD ["tinker", "-h"]

