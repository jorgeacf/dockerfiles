#!/usr/bin/env python

import consulate

consul = consulate.Consul(host='172.17.0.2')

# Set the key named release_flag to True
consul.kv['release_flag'] = True
