FROM node:21-alpine3.18

ARG PLANQK_TOKEN
ARG CTXID
ARG GITHUB_WORKSPACE

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
