# Build stage
FROM ghcr.io/cirruslabs/flutter:3.32.3 AS build

WORKDIR /app
COPY . .
RUN flutter build web --release

# Serve stage
FROM caddy:2.10.0

COPY --from=build /app/build/web /usr/share/caddy
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 80
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]