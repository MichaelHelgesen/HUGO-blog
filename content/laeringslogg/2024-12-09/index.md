---
title: 2024-12-09
date: 2024-12-09
laeringsemner: [csharp]
---
## csharp
- I C#-utvikling er feil som oppstår under applikasjonsens kjøretid (i motsetning til konstruksjons-feil som oppstår under konstruksjon-prosessen) refereres til som «exceptions», og «exception handling» er prosessen som utvikleren benytter for å håndtere disse kjøre-tid feilene i koden.
- «Errors» som oppstår under konstruksjons-prosessen refereres til som «errors» og er ikke en del av «exception handling process».
- `.snl` er en «solution»-fil som benyttes av Visual Studio Code for å håndtere prosjekter og opprettes som regel automatisk når man oppretter et nytt prosjekt i VS-Code.
- `.snl`fil benyttes av debugger for å identifisere prosjektet som skal kjøres i debug-miljø.
- launch.json inneholder en eller flere kjøre-konfigurasjoner i konfigurasjonslisten. Kjøre-konfigurasjonen inneholder en eller flere attributter for å støtte ulike debugging-scenarier. Følgende er påkrevd for hver kjøre-konfigurasjon:
    - name: Lesevennlig navn på kjøre-konfigurasjonen.
    - type: Typen debugger å benytte.
    - request: Typen kjøre-konfigurator.
    - PreLaunchTask: Spesifiserer en oppgave å kjøre før debugging av pgorammet.
    - Program: Banen til applikasjonens `.dll`-fil eller .NET.
    - Where: Rammeverk som debug-prosjektet bygges for.
- `.dll` endelsen indikerer at filen er en såkalt «dynamic link library»-fil. 
- Typiske scenarier som krever «exception handling»:
    - Dataprosessering
    - Fil input/output
    - Database-operasjoner
    - Nettverkskommunikasjon
    - Andre eksterne ressurser
```text
try { // try code block - kode som kan generere feil }
catch { // catch code block - kode som håndterer feil }
finally { // finally code block - kode som rydder opp i resurser }
```
- «try code block» inneholder overvåket kode som kan forårsake feil. Hvis koden forårsaker en feil, håndteres den av korresponderende «catch»-blokken.
- «catch»-blokken inneholder kode som kjører dersom det oppstår feil i «try»-blokken. «Catch»-blokken kan håndtere feilen, logge den eller ignorere den. Kan kjøres når alle feil skjer, eller kun spesifikke.
- «Finally»-blokken inneholder kode som kjører uavhengig av om det har oppstått en feil eller ikke. Brukes gjerne for opprydning av ressurser, som å sørge for at variabler har korrekte verdier og annet.
- «Exceptions» representeres som objekter, og dermed en instans av en klasse, og inneholder en rekke informasjon.
