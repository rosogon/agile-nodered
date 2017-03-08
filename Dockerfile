FROM resin/raspberrypi3-node:7.2.1

# node-red
RUN sudo npm install -g node-red
#RUN apt-get clean && apt-get update && apt-get install -y \
#  nodered

# install npm Q
RUN sudo npm install -g q

EXPOSE 1880

RUN npm install -g node-red-dashboard

RUN npm install -g node-red-contrib-graphs

RUN npm install -g node-red-contrib-influxdb

RUN npm install -g node-red-contrib-resinio

COPY agile-node-red-nodes agile-node-red-nodes

RUN npm install -g agile-node-red-nodes

# adding Xively support
COPY node-red-contrib-agile-xively node-red-contrib-agile-xively
RUN npm install -g node-red-contrib-agile-xively

CMD node-red