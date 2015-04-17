## Elasticsearch cluster node with unicast discovery

Run as:

````
/elasticsearch/bin/elasticsearch \
   -Des.config=/elasticsearch/config/elasticsearch.yml \
   --node.name=$ES_NODE_NAME, \
   --network.publish_host=$DOCKER_HOST_IP \
   --discovery.zen.ping.unicast.hosts=$LIST_OF_OTER_NODES_HOST_IPS
````

Deployment via [centurion](https://github.com/newrelic/centurion) recommended.
