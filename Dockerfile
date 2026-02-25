FROM caddy:2.11.1

COPY Caddyfile /etc/caddy/Caddyfile
COPY ./build/web /usr/share/caddy

EXPOSE 80
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]