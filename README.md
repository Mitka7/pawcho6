# Laboratorium 6
## Uruchomienie agenta SSH i pomyślne dodanie klucza uwierzytelniającego  
<img width="791" height="198" alt="image" src="https://github.com/user-attachments/assets/f39b37f0-608f-474a-8b20-54a8cfaad7c8" />

## Pomyślna autoryzacja w GitHub CLI przy użyciu tokenu z pliku tekstowego oraz weryfikacja statusu logowania
<img width="938" height="217" alt="image" src="https://github.com/user-attachments/assets/05890dc2-2f5b-48c5-83b1-769be3e1a2c3" />

## Inicjalizacja lokalnego repozytorium Git oraz przygotowanie plików do zatwierdzenia 
<img width="564" height="109" alt="image" src="https://github.com/user-attachments/assets/fa17a5b0-6dc9-48d6-9855-57d991f9aadd" />

## Skonfigurowanie parametrów identyfikacyjnych środowiska Git (user.email oraz user.name), a następnie dokonanie operacji zatwierdzenia zmian (commit), wprowadzając pliki Dockerfile oraz app.js do lokalnego repozytorium
<img width="628" height="482" alt="image" src="https://github.com/user-attachments/assets/e1fab9a9-2001-4b6a-a56f-2adf82573d4a" />

## Utworzenie publicznego repozytorium zdalnego na platformie GitHub za pomocą narzędzia GitHub CLI (gh) oraz wypchnięcie (push) lokalnej zawartości projektu 
<img width="635" height="264" alt="image" src="https://github.com/user-attachments/assets/72c7d473-0f88-42ed-965b-08b0beba1a95" />

## Dodanie zmodyfikowanego pliku Dockerfile do obszaru oczekującego oraz zatwierdzenie zmian w lokalnym repozytorium. Skuteczne przesłanie lokalnych zatwierdzeń do zdalnego repozytorium na platformie GitHub, skutkujące aktualizacją gałęzi main na serwerze. 
<img width="574" height="131" alt="image" src="https://github.com/user-attachments/assets/e5916e14-6e61-428b-8747-ba60779310b1" />
<img width="568" height="179" alt="image" src="https://github.com/user-attachments/assets/1470ace3-ce64-429d-87cf-01dbb82f7f9d" />

## Pomyślne zbudowanie obrazu Docker z wykorzystaniem mechanizmu BuildKit SSH, który umożliwił bezpieczne sklonowanie prywatnego kodu źródłowego z repozytorium GitHub bez pozostawiania kluczy w warstwach obrazu.
### Ze względu na izolację agenta SSH w środowisku MINGW64, która uniemożliwiała automatyczną komunikację z procesem Docker Desktop, zastosowano jawne wskazanie klucza SSH za pomocą flagi --ssh default=$HOME/.ssh/nazwa_klucza.
<img width="930" height="669" alt="image" src="https://github.com/user-attachments/assets/aa588f59-4552-45bc-af4a-07e1fab002eb" />

<img width="937" height="602" alt="image" src="https://github.com/user-attachments/assets/aa375256-90bf-4941-bd9d-fc17d32ddf89" />

## Uwierzytelnienie w rejestrze GitHub Container Registry przy użyciu osobistego tokenu dostępu, a następnie pomyślne wypchnięcie (push) zbudowanego obrazu do zdalnego repozytorium.
<img width="899" height="350" alt="image" src="https://github.com/user-attachments/assets/19793c98-2793-4655-b473-d14fd4c6b1da" />

## Finalna konfiguracja pakietu w rejestrze ghcr.io: ustawienie widoczności na Public oraz powiązanie obrazu z publicznym repozytorium kodu źródłowego pawcho6.

<img width="485" height="77" alt="image" src="https://github.com/user-attachments/assets/01ef2ac6-3a01-4b81-ba2d-c25836c5a4c6" />

## 
<img width="905" height="917" alt="image" src="https://github.com/user-attachments/assets/592cb739-9726-4e69-b2e5-db02f3c8ca0d" />


