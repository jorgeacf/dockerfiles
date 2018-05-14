#!/usr/bin/env python

import consul

consul = consul.Consul(host='172.17.0.2')

# Add a node to the catalog
c.catalog.register('nifi-1', address='172.17.0.1')

