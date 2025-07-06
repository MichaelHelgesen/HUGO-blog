---
title: 2025-07-03
date: 2025-07-03
laeringsemner: [linux]
---
## linux
- Lært om oppstartsprosessen («boot») i Ubuntu.
    1. BIOS / UEFI
    2. Bootloader
    3. Linux-kjernen («kernel»)
    4. initramfs
    5. «root»-filsystemet monteres
    6. Første prosess (PID1), gjerne et «init»-system som systemd
    7. systemd
    - BIOS / UEFI
        - BIOS er eldre og mindre fleksibelt sammenlignet med UEFI.
        - UEFI er moderne og mer fancy.
        - UEFI lar oss spesifisere en utvalgt partisjon i egendefinert størrelse for «bootloader». BIOS bruker kun meget begrenset plass i første sektor av disken (MBR).
        - Sjekk `sys/firmware/efi` om du bruker UEFI eller ikke.
    - Bootloader
        - Bruker gjerne GRUB.
        - Laster kjernen inn i minnet.
        - Initialiserer et minimum av hardvare som trengs for oppstart av systemet.
        - Finner OS-er, og starter det som velges.
    - Kjernen («kernel»)
        - Kjernen til OS-et, og selve Linux.
        - Trenger informasjon i startfasen, slik som drivere for å kunne kommunisere med hardvare. De er lagret i `initrd` eller `initramfs` og lastes sammens med kjernen.
        - Kan sende parametre til kjernen under boot via GRUB-konfigurasjon.
            - Logger
                - Linux loggfører mye under oppstart som lagres i filer.
                - Når kjernen booter kan den ikke skrive til fil, så den lagrer i noe som kalles «ring buffer» i minnet. Dette kan sees i `dmesg`, `/varlog/dmesg`.
                - Kan også se `journalctl -k` for kjerne-logg, og `journalctl -b` for boot-logg. Se også `/var/log/boot`.
                - Etter initialisering vil `syslog daemon` logge beskjeder. Den opprettholdes ved omstart `var/log/messages`.
    - Init
        - Starter tjenester og andre programmer som webserver, grafisk grensenitt, nettverk osv.
        - Tenke på det som "jeg trenger tjeneste A og B. Deretter C og D. Men ikke start D før før A og B kjører".
        - Kan bruke init-systemet etter oppstart for å manipulere prosesser senere.
        - Typer init-systemer: systemd, upstart og SysVinit.
        - Init-prosessen har ID1. Se via `ps -p1`.
    - systemd
        - Manipulere systemet etter oppstart.
        - Laget rundt konseptet «enheter».
        - «Enhet» kan være tjeneste eller handling.
        - Har navn, typebetegnelse og fil.
        - 12 ulike typer:
        ```text
        automount
        device
        mount
        path
        scope
        service
        slice
        snapshot
        socket
        swap
        target
        timer
        ```
