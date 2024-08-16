---
title: 2024-04-30
date: 2024-04-30
laeringsemner: [hugo, gnome-terminal, html, devtools]
---

### Hugo
* Endret oppsett av HUGO til [«branch»- og «leaf» bundles](https://gohugo.io/content-management/page-bundles/ "Hugo page and leaf bundles")» for enklere håndtering av bilder og andre filer tilknyttet den enkelte side. På denne måten ligger alle ressurser samme sted som teksten, i motsetning til å ha _alle_ ressurser i en og samme ressurs-mappe, som fort kan vokse seg stor og uoversiktlig.
* Lærte også om HUGOs [bildeprosessor](https://gohugo.io/content-management/image-processing/ "Hugos Image Processing") som lar oss manipulere bilder ved skalering, beskjæring, rotering og fargelegging, for å nevne noen. Og med «page bundles» som nevnt over, kan vi hente frem tilhørende ressurser på følgende måte:
```html
{{$image := .Resources.Get "sunset.jpg" }}
```
* En global ressurs hentes derimot slik:
```md
{{ $image := resources.Get "images/sunset.jpg" }}
```
* `len` er HUGOs metode for å hente lengden på en liste.
* `substr` er HUGOs metode for å returnere en del av en streng.

### Gnome-terminal
* Bruk `ls -l` («long») for mer informasjon om filene i en mappe.
* `ls -l --block-size=MB` viser størrelsen på filer i megabit.

### HTML
* Satt meg inn i `srcset`, en  måte som leverer bilder til brukeren basert på størrelse på nettleseren samt båndbredden. Metoden sørger for bedre bilder til brukeren, samt kortere lastetid. Man må da også lage flere versjoner av bildet.

### Devtools
* Endringene jeg utførte i CSS-filen ville ikke vises på nettsiden. Jeg fant ut at man kan fikse det ved å gå inn nettverksfanen i Devtools og skru på «enable cache».
