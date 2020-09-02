FROM alpine:3.11.6@sha256:9a839e63dad54c3a6d1834e29692c8492d93f90c59c978c1ed79109ea4fb9a54

ARG POSTGRES_DB

ENV POSTGRES_DB=$POSTGRES_DB

RUN apk --update --no-cache add ca-certificates postgresql 

# Get 1.4.0 Goatcounter
RUN wget https://github.com/zgoat/goatcounter/releases/download/v1.4.0/goatcounter-v1.4.0-linux-amd64.gz
RUN gunzip goatcounter-v1.4.0-linux-amd64.gz
RUN mv goatcounter-v1.4.0-linux-amd64 goatcounter
RUN chmod a+x goatcounter

COPY schema.pgsql ./
COPY entrypoint.sh ./


EXPOSE 80


ENTRYPOINT ./entrypoint.sh
