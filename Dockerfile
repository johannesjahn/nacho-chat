# Build stage
FROM ghcr.io/cirruslabs/flutter:3.32.5 AS build

WORKDIR /app
COPY pubspec.* ./
COPY api/pubspec.* ./api/

RUN flutter pub get
RUN cd api && flutter pub get

COPY . .

RUN dart run build_runner build --delete-conflicting-outputs
RUN cd api && dart run build_runner build --delete-conflicting-outputs
RUN flutter gen-l10n
RUN flutter build web --release

# Serve stage
FROM caddy:2.10.0

COPY --from=build /app/build/web /usr/share/caddy
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 80
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]