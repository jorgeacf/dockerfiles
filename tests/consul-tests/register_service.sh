#!/usr/bin/env bash

curl \
    --request PUT \
    --data @payload.json \
    http://172.17.0.2:8500/v1/agent/service/register
