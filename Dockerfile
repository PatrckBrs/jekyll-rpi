# Dockerfile Raspberry Pi Nginx
FROM hypriot/rpi-alpine-scratch

RUN apk update && \
    apk add ruby \
    ruby-dev \
    ruby-bundler
			
RUN ruby -v && gem install jekyll && cd /opt/ && jekyll new jekyll_codex

CMD ["jekyll serve -w"]
