---
title: Min Linux-maskin som en disk i Windows 
date: 2024-11-24
tekstemner: [programmering]
listeintro: "Jeg fant en praktisk applikasjon som gjør det mulig å ha en ekstern Linux-maskin som egen disk i Windows."
Description: "Jeg fant en praktisk applikasjon som gjør det mulig å ha en ekstern Linux-maskin som egen disk i Windows."
---

Jeg fikk nylig en Windows-maskin på jobben i forbindelse med læring av C# og .NET. Det ble min fjerde laptop. 

Nå har jeg en med macOS, to med Linux og en med Windows. Jeg liker best å jobbe med nettsiden via kommandolinjen i Linux, og lurte derfor på om det var mulig å koble seg til Linux-maskinen via Windows, slik at jeg slipper å ha så mange maskiner å forholde meg til.

Det er lenge siden jeg har jobbet i Windows, og først og fremst ble jeg positivt overrasket over PowerShell. Derfra koblet jeg meg til Linux-maskinen via SSH uten problem. Men å kopiere mellom maskinene var litt mer kronglete. 

Etter et søk kom jeg over [SSHFS-WIN](https://github.com/winfsp/sshfs-win), en Windows filsystem-tjener (proxy) som gjør at Linux-maskinen blir som en disk på Windows-maskinen. Det er kjempepraktisk og fungerer utmerket! 

Applikasjonen installeres enkelt via WinGet:
```text
winget install SSHFS-Win.SSHFS-Win
```
Deretter kan man i Windows Explorer opprette ønsket disk og angi sti til ekstern maskin som følger: 
```text
\\sshfs\REMUSER@HOST[\PATH]
```
{{< imgh src="linuxmaskin-som-disk-i-windows.JPEG" title="Linux-maskin som disk i Windows" alt="Nærbilde av en PC-skjerm med en annen PC i bakgrunnen." figcaption="Linux-maskinen i bakgrunnen er nå en disk på min Windows-maskin.">}}

