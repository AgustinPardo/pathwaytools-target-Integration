FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive \
    DISPLAY=:99

RUN apt-get update && \
    apt-get install -y xterm openssl inetutils-ping libjpeg8-dev libxml2 xvfb && \
    apt-get install -y vim less wget

#Agregue dependencia
RUN apt-get install -y libxm4
RUN apt-get install -y ncbi-blast+

#Agregue archivo .ncbirc
RUN echo "[ncbi]\nData=/usr/bin/data" > ~/.ncbirc
RUN echo "[ncbi]\nData=/usr/bin/data" > /root/.ncbirc
RUN echo "[ncbi]\nData=/usr/bin/data" > /.ncbirc

COPY ptools-init.dat /opt/data/ptools-local/ptools-init.dat
COPY install-pathway-tools.sh /opt/bin/install-pathway-tools.sh
COPY run-pathway-tools.sh /opt/bin/run-pathway-tools.sh
COPY pathway-tools-24.0-linux-64-tier1-install /opt/bin/pathway-tools-24.0-linux-64-tier1-install

#Agrego permisos
RUN chmod 777 /opt/bin/pathway-tools-24.0-linux-64-tier1-install

RUN /opt/bin/install-pathway-tools.sh

#CMD [ "/opt/bin/run-pathway-tools.sh" ]



# Test
# docker build -t pathway:24.0 .
# docker run --volume `pwd`:/mnt --publish 1555:1555 --rm --name pathway -it pathway:24.0 /bin/bash
# docker exec pathway:24.0 /opt/pathway-tools/pathway-tools -python
# sudo docker run --volume $PWD/batchMode:/localData --volume $PWD/PGDBs:/opt/pathway-tools/aic-export/pgdbs -d -p 5008:5008 pathway:24.0 exec /opt/pathway-tools/pathway-tools -no-cel-overview -no-web-cel-overview -patho /localData

#/opt/pathway-tools/pathway-tools -lisp -no-cel-overview -no-web-cel-overview -patho localData/test_kp13
#/opt/pathway-tools/pathway-tools -lisp -python

#sudo docker run --volume $PWD:/localData --volume $PWD/PGDBs:/opt/data/ptools-local/pgdbs -it -p 5008:5008 pathway:24.0

