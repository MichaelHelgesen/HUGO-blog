---
title: 2025-06-24
date: 2025-06-24
laeringsemner: [linux]
---
## linux

- udev: Katalogen `/dev` kalles også «user space dev» («udev»). 
    - Dette er ikke et pseudo-filsystem, slik som «sysfs» eller «proc». 
    - Her abstraheres hardvare til filer som vi kan redigere. Det fungerer som en dynamisk enhetsbehandling som er ansvarlig for å opprette, slette og gi nytt navn på filer etter hvert som enheter legges til og fjernes. 
    - «udev» sikrer i hovedsak at enheter blir gjenkjent og kan brukes av systemet. 
    - Forskjellen på «udev» og «sysfs» er i hovedsak at «udev» fokuserer på enhetsbehandling og og opprettelse av noder, mens «sysfs» er for tilgang og manipulering av enhetsinformasjon.
- D-bus: Et meldingssystem som gjør at applikasjoner kan kommunisere seg i mellom og operere på vegne av hverandre. Tenk på skrivebordet på maskinen som kan varsle om batteri, nettverk, mottatt e-post med mer.
    - Prosessene omtales også som interprosesskommunikasjon og fjernprosedyrer.
- proc: Et pseudo-filsystem som viser filer som representerer kjernens prosesser.
- Lastbare kjernemoduler: Henviser til drivere for hardvare som kreves for at OS-et kan kommunisere med enhetene.
    - ligger under `/lib/modules`.
    - Linux kommer med de fleste drivere allerede i kjernen, men ikke alt.
    - Inspiser med `lsmod` og håndteres med `modprobe`.
    - Kan bruke `-f` med `rmmod` for å tvinge avslutning av en modul som er i drift.

