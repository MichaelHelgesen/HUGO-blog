---
title: Endelig mulig å opprette sider i HUGO fra ekstern data!
date: 2024-05-21
tekstemner: [hugo, programmering]
listeintro: "Nå blir det mange spennende sider fra API-er."
Description: Den statiske sidegeneratoren HUGO kan endelig opprette sider fra API-er.
---

I dag kom jeg helt tilfeldig over en [video på YouTube](https://www.youtube.com/watch?v=UnfR2NiEhrM) som opplyste om at HUGO nå endelig kan [opprette sider fra ekstern data](https://gohugo.io/content-management/content-adapters/) som blant annet JSON, YAML og XML.

Det er gode nyheter, for mangelen på en funksjon som kan opprette sider basert på data fra API-er har vært en av HUGOs størtste ulemper. Det har vært mulig å få til via egne scripts, men nå er det altså integrert i løsningen.

Jeg ble inspirert til å teste funksjonen, og ser for meg å opprette en biblioteksside som jeg kan koble til [Zotero](https://www.zotero.org/) eller [Goodreads](https://www.goodreads.com/), for å hente omtaler av bøker jeg har lest eller anbefaler. 

(*Oppdatert: [Bibliotek]({{< relref "/bibliotek">}}) er nå opprettet, som henter omtaler fra Zotero*).

Med denne løsningen på plass er det ikke lenger behov for «work around»-metoden [jeg tidligere har skrevet om]({{< relref "opprette-sider-i-hugo-via-api" >}}).
