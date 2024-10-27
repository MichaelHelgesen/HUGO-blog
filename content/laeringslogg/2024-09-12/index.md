---
title: 2024-09-12
date: 2024-09-12
laeringsemner: [docker, bash]
---

## Docker
* For å se status på alle «containere» kan vi skrive `docker ps -a`.
* For å avslutte en «container» skriver man `docker stop ID/NAVN
* Vi kan kjøre en «container» med et ekstra «volum» som synkroniserer med «containeren». Det er praktisk under utvikling, slik at man slipper å bygge nye bilder hele tiden eller oppdatere dem.
    * Kommando: 
    ```text
    docker run -dp 5000:5000 -w /BANE -v "${pwd}:/BANE" IMAGE-NAVN
    ```
* For å se kontinuerlig «container log»: `docker logs -f NAVN/ID

## Bash
* Funksjoner i Bash må defineres før de brukes.
* To måter å angi dem på:
```bash
function my-function() {
    # kode
}

my-function() {
    # kode
}
```
* Vi angir navnet på funksjonen for å kjøre den. Ikke med parentes etter. Kun `my-function`.
* Funksjoner kan kalle andre funksjoner.
* Funksjoner kan måtta argumenter. I funksjonen henvises de til med `$1, $2, $3` og så videre. `$@` samler alle, og `$0` er selve scriptet.
* For å sende argumenter til en funksjon skriver man det etter kallet: `my-function Peter`
* Alle variabler er globale, og må defineres før de brukes.
* Variabler i funksjoner blir ikke globale før funksjonen har kjørt.
* `local MY_VAR` er en variabel som kun vil være tilgjengelig i en funksjon. Det er best practice. Lokale variabler brukes kun første gang variabelen etableres.
* Funksjoner returnerer «exit status». Den kan man definere selv også med `return KODE`. Hvis ikke angitt er det siste kommando som bestemmer. Kan kun angi manuell kode mellom 0-255.
