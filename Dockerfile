FROM node
MAINTAINER Jean-Avit Promis "docker@katagena.com"

ENV RESUME_FILE   resume.json
ENV OUTPUT_FORMAT modern

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        curl && \
    rm -rf /var/lib/apt/lists/*

RUN npm install hackmyresume -g

COPY start.sh /start.sh
RUN chmod +x /start.sh

VOLUME /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html

CMD /start.sh
