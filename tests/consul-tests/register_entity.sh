#!/usr/bin/env bash

curl \
    --request PUT \
    --data @payload-entity.json \
    http://172.17.0.2:8500/v1/catalog/register
