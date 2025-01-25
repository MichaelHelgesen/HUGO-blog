---
title: 2024-12-01
date: 2024-12-01
laeringsemner: [csharp]
---
## csharp
- `float` (flyttall) brukes for desimaltall. Hvilken presisjon man ønsker er avgjørende for valg av type.
- `float` og `double` er «base2», som betyr cirkatall. De tar mindre minne.
- `decimal` er «base10», som betyr mer nøyaktig. De bruker mer minne.
- `decimal` har «E»-notasjon, som betyr ti opphøyd i to. 5E+2 = 5 * 10² = 5 * 100.
- Referansetyper (peker til heap) deles av mange applikasjoner i OS.
    - Eks: lister, klasser og strenger. Kan holde større verdier. Ny instans av referansetype opprettes med `new`-nøkkelordet.
- `int[] data` er en nullreferanse, og peker dermed ikke til en minne-adresse enda. `int[] data = new int[3]` lager en instans av en liste og kobler variabelen til adressen.
- `string` er også en referanse, men brukes så ofte så man trenger ikke bruke `new`.
- Verdityper kopieres til ny plass i minne, og overskriver derfor ikke. Referansetype peker til samme adresse, og vil således påvirke alle «kopier».
- Valg av datatyper:
    - Bruk de som er nærmest grensen for behovet.
    - Bruk de som passer fremfor optimal ytelse.
    - Velg datatyper basert på inn- og utdata.
    - Hvis i tvil, så hold deg til standard / grunnleggende: int (hele tall), decimal (penger), bool (true / false), string (alfanumerisk).
- Er det komplekst så bruk følgende:
    - byte: enkodet data fra andre dataer eller karakter-sett.
    - double: geometrisk / vitenskapelig. For eksempel en bevegelse.
    - System.DateTime: dato / tid.
    - System.TimeSpan: Tidsforløp.
- Typekonvertering kommer an på to spørsmål:
    1. Vil konverteringen skape en feil ved kjøring?
    2. Vil konverteringen kunne føre til tap av informasjon?
```csharp
int first = 2;
string second = "4";
string result = first + second // OK som streng (implisitt)
int result2 = first + second // Feil. Tenk om second f.eks. er "hallo".
```
- For å konvertere kan man:
    - Hjelpemetode på datatypen.
    - Hjelpemetode på variabelen.
    - «Convert class»-metoden.
