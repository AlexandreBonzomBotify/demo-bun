
FROM frolvlad/alpine-glibc:glibc-2.30

WORKDIR /bun
RUN apk --no-cache add curl bash libstdc++ ca-certificates && \
    curl -fsSL -o "/bun/bun.zip" "https://github.com/Jarred-Sumner/bun/releases/download/bun-v0.1.11/bun-linux-x64.zip" && \
    unzip -d /bun -q -o "/bun/bun.zip" && \
    mv /bun/bun-linux-x64/bun /usr/local/bin/bun && \
    chmod 777 /usr/local/bin/bun && \
    rm "/bun/bun.zip" && \
    apk del curl bash

WORKDIR /app

COPY package.json package.json

COPY . .
CMD ["bun","run","index.ts"]
