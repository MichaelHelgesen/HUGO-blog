---
title: 2025-08-08
date: 2025-08-08
laeringsemner: [ngrok, snipcart, nextjs]
---
## ngrok
- En tjeneste som kan eksponere en lokal utviklingsserver, som `http://localhost:3000` til internett via en URL som for eksempel `https://fancy-url.ngrok.no`.
- Installeres med `npm install -g ngrok`.
- Kan enkelt gjøre lokale apper tilgjengelig for eksterne tjenester eller kunder, uten behov for å «deploye» noe.

## snipcart
- Et alternativ til Stripe, Shopify og andre.
- Tar i skrivende stund kun en bestemt prosent av salget. Ellers gratis å bruke.
- Enkelt oppsett, og betaling foregår med kort og PayPal.
- Mange færre funksjoner sammenlignet med for eksempel Shopify.

## nextjs
- «Routing» i Next er filbasert. Det betyr at strukturen av filer og mapper bestemmer banene i applikajonen.
- Fjerner behovet for egne konfigurasjonsfiler for «routing».
- Mapper under `app`-mappen i Next fungerer som rot-baner. En mappe kalt `blogg` i `app` vil skape banen `/blogg`.
    - For å gjøre mappen `blogg` tilgjengelig må vi legge til `page.tsx` eller `page.js`. I denne filen eksporteres en React-komponent som vises ved besøk.
- «Nested routing» fungerer ved at man har mapper i mapper, for eksempel `app/om-oss/kontakt/page.tsx` vil konvereres til banen `/om-oss/kontakt`.
- Dynamisk «routing» brukes hvor man ikke vet navnet på forhånd, som for eksempel bloggposter eller artikler. Da benyttes `[]` som mappenavn. Eks: `app/blogg/[slug]/page.tsx` som for eksempel koverteres til `/blogg/test-post`. Verdien i `[]` blir en parameter som er tilgjengelig i side-komponenten.
