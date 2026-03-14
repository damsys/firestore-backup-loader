FROM node:22.14.0-bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        openjdk-17-jre-headless \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g firebase-tools@14.2.1 \
    && firebase setup:emulators:firestore \
    && firebase setup:emulators:ui \
    && mkdir /data

COPY entrypoint.sh firebase.json /

EXPOSE 8000 4000

CMD ["bash", "/entrypoint.sh"]
