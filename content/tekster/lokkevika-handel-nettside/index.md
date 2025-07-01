---
title: Rykende ferske nettsider for Løkkevika Handel
date: 2025-06-06
tekstemner: [nettside, webdesign, hugo, strapi]
listeintro: "Løkkevika Handel har endelig fått en egen nettside."
Description: "Løkkevika Handel har endelig fått en egen nettside."
---
{{< imgh src="lokkevika_web1.webp" alt="Utsnitt av nettsidene til Løkkevika Handel." holder="LQIP" hint="image" figcaption="Løkkevika Handel har fått nye, responsive nettsider." >}}

[Løkkevika Handel](https://www.lokkevikahandel.no) er en koselig liten sommeråpen kafé med eget bakeri, som tilbyr kortreist og hjemmelagde produkter i tillegg til nydelig ferskbrygget kaffe. 

Siden oppstarten i 2017 har de stort sett markedsført seg på Facebook, men med et ønske om å etablere et eget nettsted.

Som stamkunde var jeg helt enig med innehaverne; de måtte nå ut til flere. Jeg tilbø meg derfor å hjelpe dem, mot at jeg fikk bruke god tid for å lære meg nye tjenester i prosessen.

## Teknologien
Etter å ha diskutert behovet med kafé-eierne ble nettsidene utviklet med følgende teknologi:
- [Hugo SSG](http://www.gohugo.io): Min favoritt når det kommer til statisk sidegenerator (SSG). Lynrask, enkel, åpen kildekode, i tillegg til smidig og gøy. Bygget med [Go](https://go.dev/).
- [Strapi CMS](https://strapi.io/): Et publiseringssystem basert på åpen kildekode. Sender data til Hugo via API.
- [Railway](https://railway.com/): Servertjeneste for databasen til Strapi (Postgres).
- [Vercel](https://vercel.com/): Tjener for nettstedet som bygger ny versjon når det oppdages endringer i Strapi eller Hugo.
- [Cloudinary](https://cloudinary.com/): Tjener for bilder og video som er koblet til mediabanken i Strapi.
- [Github](https://www.github.com): Lagring av kildekoden.

Dette var første gang jeg benyttet Strapi, Vercel og Railway. Jeg trenger mer erfaring med Strapi før jeg kan rettferdiggjøre en bedømmelse, men det var forholdsvis enkelt å sette opp, og enkelt for kunden å bruke. En «webhook» er koblet på mot Vercel, slik at kunden selv kan bestemme når nye versjoner av nettsiden skal bygges. Det er med på å holde kostnadene nede, sammenlignet med å bygge nye versjoner av nettsiden automatisk hver gang innholdet oppdateres. 

Railway og Vercel var også forholdsvis enkelt å få på plass, selv om Railway krevde en del opplæring. Her opprettet jeg en Postgres-server, og koblet denne til Strapi-installasjonen. Det meste foregikk via Railways CLI.

Cloudinary ble valgt fordi Strapi allerede støtter denne tjenesten, og for at den tar seg av konvertering og tilpassing av bildene via API-et. På den måten slipper Løkkevika Handel å tenke på formater og størrelser før de laster opp filer.

## Designet
Jeg fikk tilsendt et fargekart brukt i interiøret, samt annet materiell og andre innspill om fonter, innhold og design. Hovedmålet var selvsagt å få nettsiden til å reflektere følelsen av å komme inn i butikken. Altså å være «on brand». Det synes jeg vi fikk til.

{{< imgh src="profil.webp" alt="Diverse ark og utklipp som viser farger og grafiske elementer" holder="LQIP" hint="image" figcaption="Grafiske elementer og fargekart dannet utgangspunktet for designet." >}}

En ting er utseende, noe annet er hastighet og kompabilitet. Vi ønsket bevisst å ha en enkel side, så Javascript og tunge filer ble holdt til et minimum. Resultatet i Google Lighthouse viser at vi langt på vei lykkes med det.

{{< imgh src="lokkevika_web3.webp" alt="Et skjermbilde av Google Lighthouse som viser 100% på alle parametre." holder="LQIP" hint="image" figcaption="Google Lighthouse score ved lansering." >}}

## Tilbakemeldinger
Og sist men ikke minst er det mottakelsen. Nå er dette en svært enkel side, men Løkkevika Handel fikk likevel gode tilbakemeldinger:

{{< imgh src="lokkevika_tilbakemeldinger.webp" alt="Skjermbilder av meldinger fra begeistrede besøkende." holder="LQIP" hint="image" figcaption="Løkkevika Handel fikk mange gode tilbakemeldinger etter lansering." >}}

Alt i alt har dette vært et morsomt og lærerikt prosjekt. 

Jeg anbefaler selvsagt alle å besøke kaféen i løpet av sommeren.
[Løkkevika Handel](https://lokkevikahandel.no)
