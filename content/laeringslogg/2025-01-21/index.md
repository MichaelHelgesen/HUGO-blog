---
title: 2025-01-21
date: 2025-01-21
laeringsemner: [sanity, groq]
---
## sanity
- Gjennomførte kurs [Day One with Sanity Studio](https://www.sanity.io/learn/course/day-one-with-sanity-studio/prerequisites) og [Excellent editorial experiences](https://www.sanity.io/learn/course/studio-excellence/excellent-editorial-experiences) om [Sanity Studio](http://www.sanity.io/).
- Lærte om nye måter å definere datatyper på med valideringer, begrensninger, hjelpetekster, betingelser med mer.
- Lærte om hvordan man kan tilpasse Sanity Studio ved å lage faner, egne lister og utseende.
- Jeg husker nå hvorfor jeg likte Sanity så godt for noen år siden.

## groq
- Lærte at man kan benytte GROQ i API-kall for å hente ut data: `https://no44j5ip.api.sanity.io/v1/data/query/production?query=*[_type=="sitat"]{sitat,kilde->{kilde}}`
- Hvis vi spør etter referanse, så ser vi at bare selve referansen dukker opp, ikke det som refereres til. For å komme rundt det må man benytte en "pil" og deretter ny projeksjon for hva som ønskes. `headline->{tittel}`.
- I GROQ kalles `[]` for filter, og `{}` for "projection". Førstnevnte filtrerer dokumentene, mens sistnevnte lar oss bestemme hvilke data vi ønsker å hente: `*[_type == "event"]{title,date}`.
