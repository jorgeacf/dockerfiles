#!/usr/bin/env python

import consul

consul = consul.Consul(host='172.17.0.2')

# Add a node to the catalog
consul.catalog.register(
	'nifi-1',
	address='172.17.0.1',
	service = {
    	"Service": "redis",
    	"ID": "redis1",
    	"Tags": [
        	"master",
        	"v1"
    	],
    	"Port": 8000
	})

