FROM dockerfile/elasticsearch

MAINTAINER Luigis Box <support@luigisbox.com>

ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

CMD ["/elasticsearch/bin/elasticsearch"]
