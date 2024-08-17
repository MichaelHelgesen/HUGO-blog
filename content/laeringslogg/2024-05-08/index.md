---
date: 2024-05-08
title: 2024-05-08
laeringsemner: [hugo]
---

### Hugo 
* I HUGO kan kan slå sammen en variabel og streng på følgende måte:
```md
{{ printf "%s%s" "Hei" $name }}
```
* I HUGO kan man dele en samling og en streng med henholdsvis `index` og `split`. I eksempelet under kommer et fullt navn inn fra en samling i et API, hvor navnet må splittes til for- og etternavn.
```md
{{ with .lastName }}
    {{$firstName = index (split . " ") 0 }}
    {{$lastName = index (split . " ") 1 }}
{{ end }}
```
