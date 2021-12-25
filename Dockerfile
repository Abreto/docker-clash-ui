ARG CLASH_IMAGE="ghcr.io/dreamacro/clash-premium:2021.12.07"

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


FROM $CLASH_IMAGE

COPY --from=0 /ui /ui
