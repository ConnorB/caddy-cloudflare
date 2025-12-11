# Caddy with Cloudflare Modules

A minimal custom Caddy build including:

- **Cloudflare DNS provider**  
  (`github.com/caddy-dns/cloudflare`)  
  Enables DNS-01 ACME challenges for automatic TLS certificates.

- **Cloudflare IP source module**  
  (`github.com/WeidiDeng/caddy-cloudflare-ip`)  
  Provides trusted Cloudflare CIDR ranges for real client IP detection.

Multi-arch Docker images (linux/amd64, linux/arm64) are built automatically and published to GHCR.

---

## Docker Image

```
ghcr.io/ConnorB/caddy-cloudflare:latest
```

Pull the image:

```bash
docker pull ghcr.io/ConnorB/caddy-cloudflare:latest
```

---

## Example Usage

```bash
docker run -p 80:80 -p 443:443   -v $PWD/Caddyfile:/etc/caddy/Caddyfile   -e CLOUDFLARE_API_TOKEN=your_token_here   ghcr.io/ConnorB/caddy-cloudflare:latest
```

A sample Caddyfile using Cloudflare DNS:

```caddyfile
example.com {
    reverse_proxy localhost:8080

    tls {
        dns cloudflare {env.CLOUDFLARE_API_TOKEN}
    }
}
```