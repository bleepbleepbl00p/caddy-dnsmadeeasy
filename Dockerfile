FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/bleepbleepbl00p/caddy-dnsmadeeasy@v0.2.0

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
