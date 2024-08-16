---
title: 2024-04-20
date: 2024-04-20
laeringsemner: [curl, jq, gnome-terminal]
---
## Curl
* Curl er et kommandolinje-program for overføring av data med URLer. Det ble utviklet av en svenske i 1998, som fortsatt utvikler det. Det er open source.
* Skriver man `curl URL` så er `GET` satt som standard.
* Ønsker man å sende "bearer"-nøkkel kan det gjøres på følgende måte:

```text
curl URL
- H "Accept: application/JSON"
- H "Authorization: Bearer {token}"
```

* `-H` står for "headers"

## jq
* For en mer oversiktlig JSON kan vi bruke `jq`, som er en JSON prosessor, med curl:

```text
curl URL | jq "."
- H "Accept: application/JSON"
- H "Authorization: Bearer {token}"
```

## Gnome-terminal
* For å navigere opp og ned i terminal bruker man Shift + PgUp eller PgDown.
* Hvis vi "piper" på "more" etter en kommando i terminalen vil terminalen pause ved scroll, og man fortsetter med mellomrom-tasten.

```text
curl URL | more
```
