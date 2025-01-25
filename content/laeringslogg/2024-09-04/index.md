---
title: 2024-09-04
date: 2024-09-04
laeringsemner: [hugo, linux, github]
---

## Hugo
* Når man lager `public` versjon av HUGO vil alle bilder som hentes med `resources.Get.Remote` havne på rot i `public`-mappen. Det synes jeg blir rotete. 
* Man kan endre dette ved å angi en mappe foran filnavnet på ressursene man laster ned. Så i steden for `bildenavn.jpg` kan man angi `images/bildenavn-jpg`. [Se mer her](https://discourse.gohugo.io/t/setting-the-folder-for-resources-getremote-resources/37351).

## Linux
* Ønsker man å fjerne alt i en mappe bortsett fra én fil kan man i terminalen skrive:
```text
rm -v -rf !("FIL_SOM_IKKE_SKAL_SLETTES")
```
* Ønsker man å beholde flere filer kan man angi deres filnavn i parantesen med «pipe» mellom:
```text
rm -v -rf !("FIL1"|"FIL2")
```
* `-v` står for «verbose» og indikerer at vi ønsker å se hva som skjer når kommandoen kjøres.
* `-rf` står for henholdsvis «recursive» og «force» som betyr at den skal slette alle undermapper og at vi ikke skal bekrefte hver fil som skal slettes.
* **Vær forsiktig med** `rm` **kommandoen!**

## Github
* For å kunne benytte filer som starter med understrek `_` i filnavnet i Github Pages må man legge til en fil på rot med navnet `.nojekyll`.
* Dette er nødvendig hvis man bruker HUGO som SSG (static site generator) og publiserer på Github Pages.
