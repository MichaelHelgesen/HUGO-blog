---
title: 2025-06-25
date: 2025-06-25
laeringsemner: [linux]
---
## linux
- Unix-sockets
    - en form for internprosess-kommunikasjon (IPS) som lar prosesser på samme maskin kommunisere med hverander.
    - Opererer innenfor kjernen, så raskere og mer pålitelig enn nettverkst-sockets. 
    - Bruker lokale filbaner for kommunikasjon fremfor IP-adresser og porter.
    - Støtter TCP og UDP
    - Bruker server - klient modell.
    - Fordeler: ytelse, sikkerhet (kan bruke filtillatelser) og fleksibilitet.
    - `-ss`: socket status.
    - `ss -tlpn`: Se alle prosesser som lytter etter porter.
- nmap
    - `nmap localhost`: Se åpne porter med mer.
- «loopback network device»
    - Et virtuelt nettverk-grensesnitt som dirigerer trafikk tilbake til samme maskin.
    - Vi kan se et virtuelt nettverk ved at det står `%lo` i IP-adressen: `127.0.0.53%lo:53`.
    - Omtales også som «lokal DNS» («DNS resolver»). Et eksmepel er `systemd-resolved`.
    - Praktisk for å svare kjapt og enkelt på alle DNS-spørringer.
    - Slik jeg forstår det går alle DNS-spørringer innom «loopback network device».
    - Vår maskin -> lokal «DNS stub» -> internett, og tilbake.
