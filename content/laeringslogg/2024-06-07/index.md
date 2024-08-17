---
date: 2024-06-07
title: 2024-06-07
laeringsemner: [hugo, linux]
---

### Hugo
* For å vise bilder fra HUGOs «assets»-mappe brukes følgende: `{{ (resources.Get "[bane]").RelPermalink }}`.
* Man må huske på å angi «assets»-mappe i «config.toml»:
```toml
[[module.mounts]]
    source = "assets"
    target = "assets"
```
* Man oppdaterer HUGO ved å blytte ny versjon til `bin`.
* For å starte server uten å bygge «public»-versjon: `hugo server --renderToMemory`
### Linux
* `whereis` er en kommando for å lokalisere en «package», for eksempel HUGO: `whereis hugo`

