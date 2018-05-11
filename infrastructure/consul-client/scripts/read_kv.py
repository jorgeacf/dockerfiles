#!/usr/bin/env python

import consulate

consul = consulate.Consul(host='172.17.0.2')

# Get the value for the release_flag, if not set, raises AttributeError
try:
    should_release_feature = consul.kv['release_flag']
except AttributeError:
    should_release_feature = False

print(should_release_feature)

# Delete the release_flag key
del consul.kv['release_flag']
