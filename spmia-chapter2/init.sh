#!/usr/bin/env bash

echo creating kafka topic orgChangeTopic ...
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic orgChangeTopic

PGPASSWORD=p0stgr@s
echo initializing postgres database for organization service
psql -h xdubuntu1804.com -d postgres -U postgres -f organization-service/src/main/resources/schema.sql

echo initializing postgres database for licensing service
psql -h xdubuntu1804.com -d postgres -U postgres -f licensing-service/src/main/resources/schema.sql

