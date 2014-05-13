FROM ubuntu:12.04
MAINTAINER Tim Schindler "tim@catalyst-zero.com"

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential software-properties-common wget

RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bash_profile

RUN npm install node-pushserver -g
RUN mkdir -p /opt/node-pushserver/
ADD ./main.sh /opt/node-pushserver/main.sh
ADD ./config.tmpl /opt/node-pushserver/config.tmpl

EXPOSE 80

CMD ["/opt/node-pushserver/main.sh"]
