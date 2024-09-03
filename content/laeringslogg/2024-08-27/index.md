---
title: 2024-08-29
date: 2024-08-29
laeringsemner: [hugo]
---

## Hugo
* Man kan bruke `markdownify` for å konvertere for eksempel «YAML» til «markdown».
* Det er viktig å forstå forskjellen på variabler med stor og liten forbokstav i «frontmatter» i HUGO. Stor forbokstav som `.Title` indikerer HUGOs standarder, mens liten forbokstav som `.beskrivelse` indikerer egendefinerte.
```yaml
---
title: Les siste om HUGO
beskrivelse: Få med deg det siste nye om HUGO.
---
```
* I eksempelet over hentes «title» med `.Title`, mens «beskrivelse» hentes med `.beskrivelse`.
