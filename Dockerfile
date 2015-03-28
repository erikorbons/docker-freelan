FROM ubuntu:utopic

RUN apt-get -q -y --force-yes update && \
	apt-get -q -y --force-yes upgrade && \
	apt-get -q -y --force-yes install \
		git \
		scons \
		python \
		libssl-dev \
		libcurl4-openssl-dev \
		libboost-all-dev \
		libssl-dev \
		g++

RUN git clone https://github.com/freelan-developers/freelan-all.git /opt/freelan-all
	
RUN cd /opt/freelan-all && \
	scons install --prefix /usr/local

# Cleanup:
RUN mkdir /etc/freelan2 && \
	cp /opt/freelan-all/apps/freelan/config/freelan.cfg /etc/freelan2 && \
	apt-get -qy remove g++ scons git && \
	rm -rf /opt/freelan-all

COPY freelan.sh /opt/
RUN chmod +x /opt/freelan.sh

ENV FREELAN_PASSPHRASE="insecure"
ENV FREELAN_IP="9.0.0.1/24"
ENV FREELAN_CONTACT=""

EXPOSE 12000

CMD ["/opt/freelan.sh"]
