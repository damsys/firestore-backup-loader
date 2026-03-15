FROM node:24.14.0-trixie-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        openjdk-21-jre-headless \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g firebase-tools@15.10.0 \
    && firebase setup:emulators:firestore \
    && firebase setup:emulators:ui \
    && mkdir /data

COPY entrypoint.sh firebase.json /

EXPOSE 8000 4000

CMD ["bash", "/entrypoint.sh"]
