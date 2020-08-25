FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive \
    DISPLAY=:99

RUN apt-get update && \
    apt-get install -y xterm openssl 
#inetutils-ping libjpeg8-dev libxml2 xvfb && \
#    apt-get install -y vim less wget

#Agregue dependencia
RUN apt-get install -y libxm4

#BLAST para el hole-filler
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

CMD [ "/opt/bin/run-pathway-tools.sh" ]

