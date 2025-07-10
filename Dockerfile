FROM caddy:2.10.0

COPY Caddyfile /etc/caddy/Caddyfile
COPY ./build/web /usr/share/caddy

EXPOSE 80
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]