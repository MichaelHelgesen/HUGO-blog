---
title: "2024-04-25T09:15:58+02:00"
date: 2024-04-25T09:15:58+02:00
type: "læringslogg"
logs: ["hugo"]
draft: false
---
## Hugo

* I Hugo oppretter man en `dict` på følgende måte: `{{ $myDict := dict }}`.
* `dict` kan sammenlignes med Javascripts objekt.
* For å slå opp i `dict` med variabel må vi benytte `index`: `{{ index $myDict $myVar }}`.
* For å legge til i `dict` må vi bruke `merge`: `{{ $myDict = merge $myDict $newDict }}`.
* For addere i Hugo brukes `add`: {{ add 1 1 }}`.
* For å kutte strenger brukes `substr`: {{ substr $myString # # }}
* `.Site.GetPage` er en side-metode i Hugo som returnerer side(r) fra gitt bane: `{{ with .GetPage }}`. Det kan være både seksjon og vanlig side.
* For å ignorere "cache" under bygging kan man legge til `--ignoreCache`: `hugo server --ignoreCache`.
