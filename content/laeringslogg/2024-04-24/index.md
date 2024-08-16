---
title: "2024-04-24"
date: 2024-04-24
laeringsemner: [javascript]
---

## Javascript

* Lært om `this` i ulike kontekster:
    * I "function invocation", altså når man kaller eller kjører en funksjon (inkludert IIFE (immediately invoked function) / umiddelbart selvkallende funksjon) er `this` det globale objektet.
        * Bruker man `strict` er det `undefined`.
    * I et metodekall er `this` objektet som "eier" metoden, eller objektet hvor metoden er definert. Det er gjerne på venstre side av "dotten" når man kaller en metode, som her: `person.fullName()`. I dette tilfellet er `this` person-objektet.
    * I både funksjon- og metodekall kan man spørre seg selv "hvordan invokeres denne funksjonen"? som et hjelpemiddel for å huske hva `this` refererer til.
    * I "arrow"-funksjoner er `this` den omkringliggende konteksten hvor "arrow"-funksjonen selv er definert. På engelsk sier man i dette tilfellet at `this` er "lexically". Og `this` er bundet til konteksten for alltid. Den kan ikke endres.
    * For å lettere huske hva `this` er ved "arrow"-funksjoner kan man spørre seg selv "hva er "this" i den ytre konteksten hvor "arrow"-funksjonen selv er definert?".
    * I "constructor invocation" eller objektkall(?) er `this` en del av det nye objektet.

