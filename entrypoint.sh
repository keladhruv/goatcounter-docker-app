#!/bin/sh

set -e

psql $POSTGRES_DB -c '\i schema.pgsql'

./goatcounter serve -automigrate -db $POSTGRES_DB
