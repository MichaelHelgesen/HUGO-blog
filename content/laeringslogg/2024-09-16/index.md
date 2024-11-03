---
title: 2024-09-16
date: 2024-09-16
laeringsemner: [linux, jwt]
---
## Linux
- For å ta omstart fra kommando-linjen: `sudo restart now` eller `sudo shutdown -r now`
- Man kan justere fontstørrelsen på kommando-linjen med `setfont`.

## JWT
- JWT er et slags signert JSON-objekt, et objekt med en unik nøkkel som for eksempel kan brukes for å sjekke om noen er registrerte brukere, og om de er logget inn.
- En type «access token».
- Man angir gjerne en «token refresh» for sikkerhet, slik at bruker må logge seg inn på nytt etter gitt tid.
- Klient -> oppgir brukernavn og passord -> sendes via API til validering -> hvis validert så lages «access token» med unik ID for brukeren -> sendes tilbake til klienten for lagring og senere bruk.
