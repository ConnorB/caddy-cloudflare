# --- Build stage: use the official Caddy builder image with xcaddy ---
FROM caddy:builder AS builder

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
        --with github.com/caddy-dns/cloudflare \
        --with github.com/WeidiDeng/caddy-cloudflare-ip

# --- Final stage: slim runtime image with custom Caddy binary ---
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
