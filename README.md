# docker-clash-ui

[![Create and publish a Docker image](https://github.com/tnextday/docker-clash-ui/actions/workflows/release-package.yml/badge.svg)](https://github.com/tnextday/docker-clash-ui/actions/workflows/release-package.yml)

clash with clash-dashboard located at `/ui`.

Run clash in docker under [the official instructions](https://github.com/Dreamacro/clash/wiki/Run-clash-in-docker), but remember to add one line
```
external-ui: /ui
```
to your `config.yml`.

## TODO
- [ ] automatically add `external-ui: /ui` to `config.yml` if you don't do
