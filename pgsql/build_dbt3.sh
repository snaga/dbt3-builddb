#!/bin/sh

DBNAME=dbt3

PGUSER=postgres
PATH=/usr/pgsql-9.6/bin:$PATH
export PGUSER PATH

dropdb ${DBNAME}
createdb -E UTF-8 ${DBNAME}

psql -f create_tables.sql ${DBNAME}
psql -f load_tables.sql ${DBNAME}
psql -f create_indexes.sql ${DBNAME}

psql -c 'analyze' ${DBNAME}

psql ${DBNAME} <<EOF
\d+
EOF

