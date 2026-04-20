# syntax=docker/dockerfile:1.2
# ^ Włączenie Buildkita, który pozwala na bezpieczne użycie SSH

#Etap1
# Wykorzystanie obrazu Node
FROM node:alpine AS builder

# Instalacja gita i klienta SSH wewnątrz tymczasowego kontenera
RUN apk add --no-cache git openssh-client

# Utworzenie katalogu konfiguracyjnego SSH z odpowiednimi uprawnieniami oraz automatyczne pobranie i dodanie klucza publicznego serwera GitHub do listy zaufanych hostów w celu zapewnienia bezpiecznego połączenia
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

# Ustawienie katalogu roboczego
WORKDIR /app

# Klonowanie repozytorium GitHub z wykorzystaniem protokołu SSH w celu pobrania kodu źródłowego do obrazu
RUN --mount=type=ssh git clone git@github.com:Mitka7/pawcho6.git .

#Etap2 
FROM nginx:alpine

# Ponowna deklaracja ARG, aby wartość z Etapu 1 była dostępna w Etapie 2
ARG VERSION="1.0"
ENV APP_VERSION=${VERSION}

# Adnotacje OCI 
LABEL org.opencontainers.image.source="https://github.com/Mitka7/pawcho6"
LABEL org.opencontainers.image.description="Zadanie nieobowiazkowe Lab 6"
LABEL org.opencontainers.image.authors="Weronika Mitaszka <s101631@pollub.edu.pl>"

# Instalacja Node.js (do odpalenia skryptu) i curl (do sprawdzania zdrowia)
RUN apk add --update nodejs curl && rm -rf /var/cache/apk/*

# Ustawienie katalogu dla skryptu generującego stronę
WORKDIR /app

# Kopiowanie tylko niezbędnego pliku app.js z poprzedniego etapu
COPY --from=builder /app/app.js .

# Kontrola poprawności działania aplikacji (HEALTHCHECK)
HEALTHCHECK --interval=10s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

# Uruchomienie: najpierw skrypt generuje index.html, potem uruchamia się serwer Nginx
CMD ["/bin/sh", "-c", "node /app/app.js && nginx -g 'daemon off;'"]

# Otwarcie portu 80 dla ruchu HTTP
EXPOSE 80