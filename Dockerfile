FROM andreptb/oracle-java

MAINTAINER Luigis Box <support@luigisbox.com>

ENV ES_PKG_NAME elasticsearch-1.7.1

# Install Elasticsearch.
RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch

RUN /elasticsearch/bin/plugin -i elasticsearch/marvel/latest
RUN /elasticsearch/bin/plugin -install statsd -url https://github.com/Automattic/elasticsearch-statsd-plugin/releases/download/v0.3.3/elasticsearch-statsd-0.3.3.zip

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
