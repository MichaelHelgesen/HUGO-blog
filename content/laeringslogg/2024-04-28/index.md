---
title: "2024-04-28"
date: 2024-04-28
laeringsemner: [hugo]
---

## Hugo
* Vi kan angi ulike parametre for å vise når et dokument sist ble oppdatert. I `config-toml` definerte jeg følgende: 
```md
[frontmatter]
    lastmod = ["lastmod", ":fileModTime", ":default"]
```
* `lastmod` betyr at Hugo ser etter variabelen i "frontmatter". Er den ikke definert, velges heller `:fileModTime` som viser filens siste oppdatering, eller `:default`.
* Jeg fant også ut hvordan man definerer språk i `config.toml` for å vise datoer på norsk: `defaultContentLanguage = "nb"`
