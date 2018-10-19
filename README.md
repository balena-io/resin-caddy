# Resin Caddy

This is a build of https://github.com/mholt/caddy, available at
https://hub.docker.com/r/resin/caddy/

## Usage

1. Create a Dockerfile inheriting from this image (published at resin/caddy)
2. COPY a Caddyfile into /var/lib/caddy/Caddyfile in the new image
3. Build and run your new image!

Or, you can just run resin/caddy and bind-mount in a Caddyfile.

