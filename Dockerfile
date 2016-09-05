# Dockerfile Raspberry Pi Nginx
FROM hypriot/rpi-alpine-scratch

RUN apk update && \
	apk add bash build-base readline readline-dev libxml2 libxml2-dev \
	ncurses-terminfo-base ncurses-terminfo libxslt libxslt-dev zlib-dev zlib yaml yaml-dev \
	libffi-dev git && \
    apk add ruby ruby-dev ruby-bundler && \
	rm -rf /var/cache/apk/*
			
RUN ruby -v && gem install jekyll && mkdir /opt && cd /opt && jekyll new jekyll_codex

RUN apk del build-base zlib-dev ruby-dev readline-dev \
        yaml-dev libffi-dev libxml2-dev \
 	&& apk search --update

EXPOSE 4000
 
#ENTRYPOINT ["jekyll"]
CMD jekyll serve -w
