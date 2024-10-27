---
title: 2024-09-08
date: 2024-09-08
laeringsemner: [docker]
---

## Docker
* Docker er en tjeneste som leverer standariserte enheter av mykvare som de kaller «container». 
* En «container» er som en pakke med kode og tilhørende «packages» og verktøy. Man kan kjøre programmer uten å hente noe fra et annet sted.
* «Container» kan sammenlignes med en piknikkurv. I kurven har man alt man trenger for å sprise et måltid: tallerkner, glass, bestikk og mat. Den kan også leveres til en venn, og vennen trenger ikke bekymre seg for innholdet. Alt er samlet i kurven.
* En «container» fylles altså med det man trenger, uten behov for å mikse med innhold i andre «containere». Den kan modifiseres, og den virker for seg selv («stand-alone»). Den vil også virke alle andre steder som kan håndtere en «container».
* Docker gjør opprettelsen og håndteringen av slike «containere» enkelt.
* Hvorfor ikke virtuelle maskiner? Det er også et innkapslet område, men de krever mye mer ressurser og tar mye plass på harddisken.
* To konsepter i Docker: 
    * «Images»
    * «containers»
* «Images» er som en mal for å skape «containere». En «container» er en instans av et «image». Man kan etablere mange «containere» fra en «image».
* «Images» er en mal som inneholder koden, verktøyene og rutinene, mens en «container» er den kjørende / aktiverte mykvare-enheten.
* Installere en «container» fra en «image»: `docker run IMAGE-NAVN`
* For å «åpne dørene» til en «container» og starte en interaktiv «session» fra «containeren» til vår maskin: `docker run -it IMAGE-NAVN`
* Se alle Docker-prosesser på maskinen: `docker ps -a`. `ps` står for «processes» og `-a` betyr «all».
