---
title: 2025-06-26
date: 2025-06-26
laeringsemner: [linux]
---
## linux
- Brannmur:
    - Ekstra sikkerhet når man åpner porter.
    - Linux har innebygd brannmur som `netfilter`.
    - Vi kan konfigurere denne med program som `iptables`.
    - «Frontend» for `iptables` er program som `ufw` som gjør det enklere for oss å konfigurere brannmur.
```bash
iptables -l # se gjeldende regler.
iptables -F # slett alle regler.
ufw allow # gi tillatelse
ufw deny # nekte tillatelse
ufw enable # aktivere endringer
ufw status verbose # se enkel status
```
