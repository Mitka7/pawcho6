const fs = require('fs');
const os = require('os');

// Pobranie wersji przekazanej przez ARG/ENV w Dockerfile
const version = process.env.APP_VERSION || "Nieznana";

// Pobranie nazwy kontenera
const hostname = os.hostname();

// Pobranie konfiguracji sieciowej dla interfejsu eth0 (standard w Dockerze)
const interfaces = os.networkInterfaces();
const eth0 = interfaces['eth0'];

// Wyodrębnienie adresu IPv4 z interfejsu eth0
const ip = eth0 ? eth0.find(i => i.family === 'IPv4').address : 'Brak IP';

const html = `
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Laboratorium 5</title></head>
<body>
    <h1>Informacje o serwerze</h1>
    <p><strong>Wersja aplikacji:</strong> ${version}</p>
    <p><strong>Nazwa serwera (hostname):</strong> ${hostname}</p>
    <p><strong>Adres IP serwera:</strong> ${ip}</p>
</body>
</html>`;

// Zapisanie gotowego pliku HTML w katalogu domyślnym serwera Nginx
fs.writeFileSync('/usr/share/nginx/html/index.html', html);
console.log("Plik index.html został wygenerowany.");