---
title: Jeg videreutvikler min hjemmeserver
date: 2026-01-02
tekstemner: [hjemmeserver]
serier: [hjemmeserver]
listeintro: "En Mac Pro skal bli min nye hjemmeserver."
Description: "En Mac Pro skal bli min nye hjemmeserver."
ingress: "Jeg har nylig fått tak i en Mac Pro 2013-modell (søppeldunken). Den tenker jeg å konvertere til en hjemmeserver som skal erstatte min Raspberry Pi."
---

{{< imgh src="mac.webp" alt="Mac Pro on a table surrounded by keyboard, notes and pens." holder="LQIP" hint="photo" figcaption="En Mac Pro 2013 klar for nye oppgaver, etter en real rens." >}}

Ønsket på sikt er å bygge en driftsikker og energieffektiv server som kan erstatte noen av de mange sky- og abonnementsløsningene til teknologigigantene, samt å vri meg ut av algoritmenes grep. Jeg håper derfor å kunne drifte både bilde-, video- og musikkservere, og kanskje til og med egne servere for webutvikling.

## Foreløpig læringsmål:
- Linux og systemadministrasjon
- Docker og containerisering
- Nettverk og sikkerhet
- Server/backend-programmering med Node.js/TypeScript

Alt jeg lærer på veien planlegger jeg å publisere som en serie her på nettsiden.

Første steg vil innebære en formatering av Mac-en, og installasjon av en Linux-distribusjon for å se om maskinvaren støttes. 

Etter et kjapp søk på nettet, har jeg notert meg følgende anbefalt programvare:

| Behov            | Anbefalt programvare             |
| ---------------- | -------------------------------- |
| Bilder           | Immich                           |
| Musikk           | Navidrome                        |
| Multimedia/video | Jellyfin                         |
| Webutvikling     | Docker + Nginx Proxy Manager     |
| Fillager         | Nextcloud (Dropbox-alternativ)   |
| Container        | Docker                           |

## Maskinvareoversikt Mac Pro:
Jeg har forstått at de følgende spesifikasjonene kan ta meg langt når det kommer til serverdrift, men i dette tilfelle er det designet av maskinen som vil være den største utfordringen. Den såkalte søppelbøtten er kanskje kul å se på, men den blir svært varm, og samler enormt med støv. Det er ingen god kombinasjon. 

Jevnlig rengjøring blir viktig, så bytter jeg heller ut maskinen etter hvert. Nå er det læring som gjelder.

- Modellnavn: Mac Pro
- Modellidentifikator:	MacPro6,1
- Prosessornavn: Sekskjerners Intel Xeon E5
- Prosessorhastighet:	3,5 GHz
- Antall prosessorer: 1
- Totalt antall kjerner: 6
- Nivå 2-buffer (per kjerne): 256 kB
- Nivå 3-buffer: 12 MB
- Hyper-Threading-teknologi: Aktivert
- Minne: 64 GB
- Ethernet-enheter: Broadcom 57762-A0:
- Grafikk: AMD FirePro D500:
- USB 2, USB 3, Thunderbolt

Dette blir spennende, og veldig moro!
