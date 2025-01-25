---
title: 2024-11-27
date: 2024-11-27
laeringsemner: [csharp]
---
## csharp
- En hovedgrunn til å velge `do while` er hvis noe i kodeblokken påvirker «exit»-statusen.
- Enkelte ganger kan det være vi ønsker å hoppe over resterende kode i kodeblokken til en `do while`. Da kan vi bruke nøkkelordet `continue`. Da forteller vi at vi ønsker å hoppe rett til bool-uttrykket i `while`. Altså å gå direkte til neste iterasjon.
- «nullable type» tillater variabler å ha `null`-verdi. Det markeres med et spørsmålstegn: `string? input = null`. «Nullable type» er nyttig for verdier som ikke skal være `null`, og man kan sjekke opp mot dette: `variabel != null`.
- `TryParse` prøver å konvertere en streng til en annen type som `int` eller `double`, og returnerer en boolsk verdi basert på resultatet av konverteringen.
    - Tar to parametre: en streng som skal konverteres og en `out` variabel som inneholder resultatet av konverteringen, hvis vellykket. 
    - `TryParse(string, out result)`.
