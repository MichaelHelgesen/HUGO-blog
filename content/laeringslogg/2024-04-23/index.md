---
title: 2024-04-23
date: 2024-04-23
laeringsemner: [hugo, git]
---
## Git
* Hvis man ønsker å angre `git commit` kan man skrive `git reset`.

## Hugo
* `isset`: Sjekker om nøkkel eksisterer. For eksempel `{{ if isset .Type }}`
* `if`: Sjekker om uttrykk er sant.
* `if eq`: Sammenligner to argumenter.
* `if not`: Returnerer `bool` av argument.
* `dict "key" "value"`: Kalles å lage en "map" fra en liste av nøkler og verdier. Er tilsvarende et objekt i JavaScript.
* Vi kan sende variabler i "partial templates": `{{ partial "list.html" (dict "A" 1 "B" 2)}}`.
