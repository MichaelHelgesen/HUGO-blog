---
title: "2024-04-27T07:57:36+02:00"
date: 2024-04-27T07:57:36+02:00
laeringsemner: [terminal, hugo]
draft: false
---

### Terminal

* Man kan bruke variabler/funksjoner i terminalen sammen med andre funksjoner. Når jeg skal opprette filer med dato som filnavn kan jeg skrive følgende i terminalen: `hugo new blogg/$(date).md.

### Hugo
* Shortcodes er kommandoer vi kan angi i "markdown"-filer, for å injisere kode i sidene som renderes. De kan kalles på ulike måter:

```md
{{ /* Metode 1 */ }}
{{ < myShortcode data="This is data" > }}

{{ /* Metode 2 */ }}
{{ < myShortcode > }}
    This is data
{{ < /myShortcode >}}
```

* `myShortcode` over henviser til `myShortcode.html` som må plasseres i `/layout/shortcodes/myShortcode.html`. Dataene hentes henholdsvis på følgende måte:
```go
{{ /* Metode 1 */}}
{{ .Get data}}

{{ /* Metode 2 */ }}
{{ .Inner }}
```
