---
title: 2024-12-08
date: 2024-12-08
laeringsemner: [csharp]
---
## csharp
- Når et argument sendes til en metode, vil variabler av verdi-type kopieres inn i metoden. Hver variabel har sin egen kopi, så original-variabelen modifiseres ikke.
- Med referanse-typer så kopieres adressen til verdien inn i metoden. Variabelen som gis til metoden refererer til verdien på adressen, så operasjoner på den variabelen vil påvirke variabelen referert til av den andre.
- Det er viktig å huske at `string` er en referanse-type, men den er «immutable». Den kan altså ikke endres. Når metoder og operander benyttes for å modifisere en streng i C# er det et nytt streng-objekt som returneres.
- Man kan navngi parametre i en metode ved å angi et navn, etterfølgt av kolon og en verdi. Det definerer et navngitt argument.
- Når navngitte argumenter brukes med posisjonelle argumenter er kun gyldige om de angis i riktig rekkefølge.
- Navngitte argumenter er også gyldige så lenge de ikke etterfølges av posisjonelle argumenter.
- Navngitte argumenter trenger ikke å oppføres i den originale rekkefølgen.
- En parameter blir valgfri når den tildeles en standard verdi. Hvis en valgfri parameter ikke inkluderes i argumentene, brukes standardverdien når metoden kjører.
- Påkrevde argumenter bør defineres før de valgfrie.
- Retur-verdien i en metode må matche data-typen spesifisert i metoden.
