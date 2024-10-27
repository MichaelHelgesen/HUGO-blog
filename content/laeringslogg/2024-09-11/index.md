---
title: 2024-09-11
date: 2024-09-11
laeringsemner: [nvim, curl, docker]
---

## Curl
* For å se statusinformasjon om forespørselen så legger man til `-i`.
* Ønsker man å skrive en kommando over flere linjer i kommandolinjen kan vi benytte `\` deretter linjeskift, for å gå til neste linje.

## NVIM
* For å se terminalen i Neovim kan vi skrive `:terminal` eller `:term`.

## Docker
* For å lage et Docker «image» fra en Dockerfil skriver man `docker build .` fra banen med Dockerfilen i. 
* Ønsker man å gi den en emneknagg kan man skrive følgende: `docker build -t EMNEKNAGG .`.
* For å starte en Docker «deamon»: `systemctl start docker`.
* Se alle «images»: `docker images`.
* Starte en Docker «container» fra «image»: `docker run IMAGE-NAVN`.
* Angi port ved opprettelse av «container»: `docker run -d -p NY_PORT:CONTAINER_PORT IMAGE-NAVN`. `-d` betyr at prosessen skal kjøre i bakgrunnen, mens `-p` står for port.
* Docker «compose» lar oss kjøre flere «images» med felles innstillinger. Da slipper man å gjøre det manuelt flere ganger. Først må man lage en fil `docker-compose.yml`, med for eksempel følgende kode:
```yml
version: "3"
services: 
  web:
    build: .
    ports: 
      - "5000:5000"
    volumes: 
      - .:/app
```


