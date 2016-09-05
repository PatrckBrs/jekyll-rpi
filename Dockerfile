# Dockerfile Raspberry Pi Nginx
FROM hypriot/rpi-alpine-scratch

RUN apk update && \
    apk add bash build-base && \
    apk add ruby ruby-dev ruby-bundler ruby-io-console ruby-irb ruby-json ruby-rake && \
    rm -rf /var/cache/apk/*
			
RUN ruby -v && gem install jekyll && cd /opt/ && jekyll new jekyll_codex

CMD ["jekyll serve -w"]
