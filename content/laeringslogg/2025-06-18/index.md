---
title: 2025-06-18
date: 2025-06-18
laeringsemner: [linux]
---
## linux
- For å åpne filer med spesielle navn som `-` må vi angi banen: `cat ./-`.
- Vi kan sette sammen flere argumenter i `find`. som `-user [USERNAME] -group [GRUPPE] -size [STØRRELSE]`.
- Skjule "error" fra en fil med `find`: `2> /dev/null`. `2` er "stderr", altså "error-strømmen", og den kan vi sende til "null" slik at det altså ikke returnerer noe.
- `systemd` og `systemctl`: kommandoer for å kontrollere "init-programmet".Det vil si status på operativsystemet under og etter oppstart.
