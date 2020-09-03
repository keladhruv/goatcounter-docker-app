#!/bin/sh

set -e

psql $POSTGRES_DB -c '\i schema.pgsql'

./goatcounter serve -listen :8085 -port 8085 -tls none -automigrate -db $POSTGRES_DB
