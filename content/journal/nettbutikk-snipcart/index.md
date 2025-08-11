---
title: Nettbutikk med Sanity, Next.js og Snipcart
date: 2025-08-10
tekstemner: [programmering, sanity, nextjs]
listeintro: "Test av ny teknologi til nettside og nettbutikk for en kunstner."
Description: "Test av ny teknologi til nettside og nettbutikk for en kunstner."
---

En Kitchmaler lurte på om jeg kunne hjelpe henne med nye nettsider. Det gav meg en god anledning til å teste ny teknologi.

{{< imgh src="nettbutikk3.webp" title="Min første hjemmeserver" figcaption="Skisse på startside med produktoversikt og handlekurv." alt="Nærbilde av Raspberry Pi 5 med nettverkskabel koblet i." >}}

- **Sanity.io**: Jeg har lenge vært glad i Sanity. Jeg synes det er gøy å bruke, og tilpasse.
- **Next.js**: Dette er første gang jeg prøver Next.js, en løsning mange skryter av. Det spennende er at den kan både brukes til statisk sidegenerering (SSG) og serverside-generering (SSR). Sanity.io benytter også dette, så dokumentasjonen er god.
- **Snipcart**: En enkel nettbutikksløsning med kortbetaling og PayPal.

{{< imgh src="nettbutikk1.webp" title="Min første hjemmeserver" figcaption="Skisse på landingsside for et kunstverk med kjøp-knapp" alt="Nærbilde av Raspberry Pi 5 med nettverkskabel koblet i." >}}

Siden hostes på Vercel som er koblet til prosjektet via Github. På den måten kan kunden se en utviklingsversjon mens vi utvikler siden.

{{< imgh src="nettbutikk2.webp" title="Min første hjemmeserver" figcaption="Handlekurv med kortbetaling" alt="Nærbilde av Raspberry Pi 5 med nettverkskabel koblet i." >}}

{{< imgh src="nettbutikk4.webp" title="Oversikt over ordre i Snipcart" figcaption="Oversikt over ordre i Snipcart." alt="Nærbilde av Raspberry Pi 5 med nettverkskabel koblet i." >}}

Et veldig morsomt prosjekt. Nå gjenstår å lære hvordan nettsiden kan bygges ved endringer i Sanity.
