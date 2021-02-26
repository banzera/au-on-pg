#!/bin/zsh
#
DB_NAME=${1:-"au-new"}

dropdb   $DB_NAME
createdb $DB_NAME

psql -d $DB_NAME < ddl/au-audit.sql
psql -d $DB_NAME < ddl/indexes.sql
psql -d $DB_NAME < ddl/foreign_keys.sql
psql -d $DB_NAME < ddl/sequences.sql

psql -d $DB_NAME < ddl/load_data.sql
