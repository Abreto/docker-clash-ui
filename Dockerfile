ARG YACD_VERSION="v0.3.4"

FROM node:lts

ARG CLASH_DASHBOARD_VERSION="c27f57eb1fb08f8fa08b7c69fff6f963a0760af5"

WORKDIR /src

RUN set -ex;\
    git clone https://github.com/Dreamacro/clash-dashboard.git; \
    cd clash-dashboard; \
    git checkout $CLASH_DASHBOARD_VERSION; \
    npm install -g pnpm; \
    pnpm install; \
    pnpm build; \
    mkdir -p /ui; \
    cp -R dist/* /ui;

FROM haishanh/yacd:$YACD_VERSION as yacd

FROM alpine:3.15


COPY --from=0 /ui /www/ui
COPY --from=yacd /usr/share/nginx/html /www/yacd

RUN apk add -U --no-cache darkhttpd;

ENV PORT 8080

CMD darkhttpd /www/ --no-listing --port $PORT