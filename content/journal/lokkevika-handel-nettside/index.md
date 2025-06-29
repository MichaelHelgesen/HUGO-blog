---
title: Rykende ferske nettsider for Løkkevika Handel
date: 2025-06-06
tekstemner: [nettside, webdesign, hugo, strapi]
listeintro: "Løkkevika Handel har endelig fått en egen nettside."
Description: "Løkkevika Handel har endelig fått en egen nettside."
---
Løkkevika Handel er en koselig liten kafé i Løkkevika som fokuserer på kortreist og hjemmelagde produkter med surdeigsbrød og nydelig kaffe. Siden oppstarten i XXXX har de stort sett operert på Facebook, men hatt et ønske om egne nettsider.

Det synes jeg de burde ha, så jeg tilbø meg å hjelpe dem. Jeg benyttet anedningen til å prøve ut tjenester jeg ikke har brukt før, for å lære noe nytt i prosessen.


## Teknologien
Nettsidene er skapt med følgende teknologi / tjenester:
- Hugo SSG: Min favoritt når det kommer til statiske nettsider. Rask og enkelt, i tillegg til smidig og gøy. Bygget på Go.
- Strapi CMS: Et publiseringssystem basert på åpen kildekode. Sender data til Hugo via API.
- Railway: Servertjeneste for databasen til Strapi (Postgres).
- Vercel: Tjener for nettstedet som bygger ny versjon når det er endringer i Strapi eller Hugo.
- Cloudinary: Tjener for bilder som er koblet til mediabanken i Strapi.
- Github: Lagring av kildekoden.

Dette var første gang jeg benyttet Strapi, Vercel og Railway. Jeg trenge mer erfaring med Strapi før jeg kan rettferdiggjøre en bedømmelse, men det var forholdsvis enkelt å sette opp, og enkelt for kunden å bruke. En webhook er koblet på mot Vercel, slik at kunden selv kan bestemme når nye versjoner av nettsiden skal bygges. Det er med på å holde kostnadene nede, sammenlignet med at det bygges nye versjoner hver gang innholdet redigeres. 

Railway og Vercel var også forholdsvis enkelt å få på plass, selv om Railway krevde en del opplæring. Jeg opprettet en Postgres-server i Railway og koblet denne til Strapi-installasjonen. Det meste foregikk via Railways CLI.

Cloudinary ble valgt fordi det allerede støttet Strapi, og for at tjenesten tar seg av konvertering og tilpassing av bildene. På den måten slipper jeg å be eierne av nettsiden å tilpasse bildene før de laster dem opp.

## Designet
Jeg fikk tilsendt et fargekart brukt i interiøret, samt andre ønsker og innspill om fonter, innhold og design. Hovedtanken var å prøve å reflektere følelsen av å komme inn i butikken. Altså å være «on brand». Det synes jeg vi fikk til.

Bilde

En ting er designet, noe annet er hastighet og kompabilitet. Vi ønsket bevisst å ha en enkel side, så Javascript og tunge filer er holdt til et minimum. Resultatet i Google Lighthouse viser at vi langt på vei lykkes med det.

Bilde av Google Lighthouse

Og sist men ikke minst er det mottakelsen. Nå er dette en svært enkel side, men Løkkevika Handel har likevel fått gode tilbakemeldinger:

Bilde av tilbakemeldinger.

Et morsomt og lærerikt prosjekt. Jeg anbefaler selvsagt alle å besøke kaféen. 
