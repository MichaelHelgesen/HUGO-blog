---
title: 2024-12-11
date: 2024-12-11
laeringsemner: [csharp]
---
## csharp
- «Exception»-klasse i C#:
    - Data: Diverse data i nøkkel-verdi-par.
    - HelpLink: Kan inneholde en URL til en hjelpefil for mer informasjon om feilen.
    - HResult: Kan gi tilgang til nummer-verdi tilknyttet feilen.
    - InnerException: Kan brukes til å lage og lagre en serie feil under feilhåndteringen.
    - Message: Beskjed med mer detaljer om feilen.
    - Source: Kan brukes for å gi tilgang til navnet på applikasjonen eller objektet som forårsaker feilen.
    - StackTrace: Inneholder stien til «stack»-en, for å kunne se når feilen oppsto.
    - TargetSite: Kan brukes for å få tak i metoden som sender den gjeldende feilen.
```csharp
catch (Exception ex)
    {
        Console.WriteLine($"Exception caught in Process1: {ex.Message});
    }
```
- I koden over fanger vi en instans av «Exception»-klassen i et objekt kalt «ex».
- Å skape og fange «exceptions» er en viktig del av C#-programmering for å sørge for funksjonelle applikasjoner.
- Noen vanlige «exceptions»-typer når man skal skape «exceptions»:
    - ArgumentException / ArgumentNullException: Brukes når en metode eller «constructor» kalles med ugyldig argument eller null.
    - InvalidOperationException: Brukes når en metode ikke støtter fullføring av et metode-kall.
    - NotSupportedException: Brukes når en operasjon eller egenskap ikke støttes.
    - IOException: Brukes når «input/output»-operasjon feiler.
    - FormatException: Brukes når formateringen av en streng eller data er feil.
- `new`-nøkkelordet benytten når man skal opprette en instans av en «exception». `throw` benyttes for å «kaste» objektet.
- Et «exception»-objekt kan også opprettes direkte i en «throw-statement».
- Metoder bør melde en «exception» hver gang de ikke kan fullføre tiltenkt formål.
- Ting å unngå med «exceptions»:
    - Ikke bruk det for å endre flyten av et program som en del av den originale kjøringen. Bruk det kun for å håndtere feil.
    - «Exceptions» bør ikke returneres som retur-verdier eller parameter. Kun kastes.
    - Ikke kast «System.Exception, System.SystemException, System.NullReferenceException» eller «System.IndexOutOfRangeException» med vilje fra egen kildekode.
    - Ikke opprett «exceptions» som kan kastes i «debug»-modus men ikke i «release»-modus. For å identifisere «runtime errors» i utviklingsfasen bør man heller benytte «Debug.Assert».
