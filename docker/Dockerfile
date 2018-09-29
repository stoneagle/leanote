FROM mongo:3.0
COPY ./sources.list /etc/apt/sources.list
COPY ./wkhtmltox/bin /tmp
RUN apt-get update && \
	apt-get install --quiet --yes --force-yes --no-install-recommends libxext6 libxrender1 libfontconfig1 && \
	mv /tmp/wkhtmltopdf /usr/local/bin
COPY ./simsun.ttc /usr/share/fonts/truetype/dejavu/simsun.ttc
