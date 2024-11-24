---
title: 2024-11-22
date: 2024-11-22
laeringsemner: [csharp]
---
## Csharp
- `\n` og `\t` står for henholdsvis ny linje og tabulator. Sistnevnte lager mellomrom på størrelsen med fire karakterer. For å vise en bakstrek i tekst uten at det blir registrert som en «escape» skriver vi to bakstreker.
- Bakstrek kan også brukes for å vise UTF-karakterer, som `\u3053`.
- Microsoft skriver at man bør unngå å bruke midlertidig variabel før den brukes slik som dette:
```c#
string hilsen = $"Hei {navn}";
Console.WriteLine(hilsen);
```
- De anbefaler at strengen kombineres der den faktisk skal brukes:
```c#
    Console.WriteLine($"Hei {navn}");
```
- Strenger:
    - «Verbatim string literal '@'» brukes for å beholde alle mellomrom i en streng, og for å slippe å omgå bakstrek som tolkes som «escape».
    - «String interpolation» (strenginterpolering) er C#s måte å benytte variabler i strenger, som konverteres til en streng, lik Javascripts «template literals». `$"{}"`.
    - Man kan slå sammen verbatim og strenginterpolering: `$@"Hei!\n\t{navn}"`.
    - C# kan midlertidig konvertere fra nummer til streng om man slår sammen «string» og «int», `"Jeg er " + 174 + " høy"`, men det er best å unngå. Bruk heller strenginterpolering.
- Variabler:
    - Desimal-operasjoner bør benyttes på en eller flere tall som faktisk er desimaltall: `3.14m + 3`;
    - «Typecasting» eller typekonvertering foregår ved å angi ønsket konvertering i parentes foran variabelen som skal konverteres: `decimal quotient = (decimal)first / (decimal)second;`.
- .NET:
    - .NET er en utviklingsplattform fra Microsoft som brukes til å lage en rekke applikasjoner, blant annet nettsider, mobil-apper og program. Den inneholder flere ulike programmeringsspråk og et stort bibliotek av metoder og funksjoner med mer. .NET er også kjøremiljøet («runtime environment») for applikasjonene som utvikles. Man må ha .NET for å kjøre C#, men ikke for å skrive det.
    - Strukturen C#-prosjekter er `løsninger/prosjekter`. Man samler altså flere prosjekter under en løsning («solution»). Det er også flere ulike typer prosjekter å velge mellom. 
    - For å opprette et prosjekt i «solutions»-mappen skriver man `dotnet new console - MyApp`.
        - `console` er typen prosjekt.
        _ `-o` betyr å opprette banen som følger i kommandoen.
    - I prosjekt-mappen opprettes ytterligere to mapper: `obj` og `bin`. Førstnevnte inneholder alle objekter som trengs for å lage en EXE-versjon av applikasjonen, mens `bin` inneholder det faktiske prgrammet etter at det er kompilert.
    - Det opprettes også to filer: selve `.cs`-fila, som er der vi skriver koden, samt `prosjekt.csproj` som er en prosjekt-fil med informasjon. Den får samme navn som prosjektet når man oppretter det.
    - For å kompilere en versjon skriver vi `dotnet build`.
    - For å kjøre prosjektet skriver vi `dotnet run`.
