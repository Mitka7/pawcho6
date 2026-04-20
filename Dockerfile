#Etap1
# Wykorzystanie obrazu Node
FROM node:alpine AS builder

# Ustawienie katalogu roboczego
WORKDIR /app

# Definiowanie argumentu wersji dostępnego podczas budowania
ARG VERSION="1.0"
# Zapisanie wersji do zmiennej środowiskowej
ENV APP_VERSION=${VERSION}

# Kopiowanie skryptu do obrazu tymczasowego
COPY app.js .

#Etap2 
FROM nginx:alpine

# Ponowna deklaracja ARG, aby wartość z Etapu 1 była dostępna w Etapie 2
ARG VERSION
ENV APP_VERSION=${VERSION}

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