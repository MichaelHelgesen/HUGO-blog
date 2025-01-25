---
title: 2024-12-05
date: 2024-12-05
laeringsemner: [csharp]
---
## csharp
- «Composite formating» bruker nummererte «placeholders» i f.eks. streng, etterfulgt av variablene. `string.Format("{0} {1}!"), first, second);`
- «Placeholders» kan plasseres hvor som helst i uvilkårlig rekkefølge, og gjentas så mange ganger som ønskelig.
- `:C` kan brukes for valutta. `{price:c}` blir automatisk formatert som valutta.
- `:N` gjør nummer mer leselige.
- `:P` formaterer prosent og runder til to desimaler. Legg til et tall bak for å kontrollere antall siffer etter dedimal `:P2`
- Man kan gjøre utregninger direkte med streng interpolasjon og «composite formating». `$"A discount of {((price - salePrice)/price):P2}!"`
- «PadLeft#» angir mellomrom foran en streng til hele strengen har ønsket lengde: `PadLeft(12)`.
- Man kan også angi tegn fremfor mellomrom med `PadLeft(12, "-")`.
- Bruk `indexOf()` for å finne plasseringen av et tegn i en streng.
- `Substring(index, lengde)` henter ut tegn fra en streng fra angitt plassering («index») til angitt lengde.
```c#
int openingPosition = message.IndexOf("<span>"); 
int closingPosition = message.IndexOf("</span>"); openingPosition += 6; 
int length = closingPosition - openingPosition; 

Console.WriteLine(message.Substring(openingPosition, length));
```
- Hardkodede strenger som «<span>» i eksempelet over kalles «magic strings» og hardkodede verdier som 6 kalles «magic numbers». Disse "magiske nummerne" er best å prøve å unngå.
