# Dockerfile Raspberry Pi Nginx
FROM hypriot/rpi-alpine-scratch

RUN apk update && \
	apk add bash build-base readline readline-dev libxml2 libxml2-dev \
	ncurses-terminfo-base ncurses-terminfo libxslt libxslt-dev zlib-dev zlib yaml yaml-dev \
	libffi-dev git nodejs && \
    apk add ruby ruby-dev ruby-bundler && \
	rm -rf /var/cache/apk/*
			
RUN ruby -v && gem install jekyll && cd /opt/ && jekyll new jekyll_codex

CMD ["jekyll serve -w"]
