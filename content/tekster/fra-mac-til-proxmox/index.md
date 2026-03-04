---
title: Fra Mac til Proxmox
date: 2026-02-04
tekstemner: [hjemmeserver]
serier: [hjemmeserver]
listeintro: "Slik installerte jeg Proxmox og opprettet min første virtuelle Ubuntu-maskin på Mac Pro 2013-modell"
Description: "Slik installerer man Proxmox på en Mac Pro 2013."
ingress: "Under planleggingen av serveroppsett konkluderte jeg med at Proxmox ville passe perfekt. Den lar meg kjøre flere Linux-distribusjoner på én maskin, for maksimal læring og testing. Men veien dit var ikke uten utfordringer."
---

{{< imgh src="mac.webp" alt="Mac Pro on a table surrounded by keyboard, notes and pens." holder="LQIP" hint="photo" figcaption="En Mac Pro 2013 klar for nye oppgaver, etter en real rens." >}}

I og med at jeg ønsker å bli godt kjent med Linux må jeg nødvendigvis også prøve flere av de mange distribusjonene som finnes: Ubuntu, Fedora, Arch og Mint, for å nevne noen.

En server som kjører Proxmox er perfekt i et slikt tilfelle. Det lar meg initialisere flere virtuelle maskiner, som fungerer som enkeltstående Linux-installasjoner. Proxmox tilbyr både et grafisk grensesnitt via nettleseren, og en terminal for oppsett og håndtering.

## Steg 1: installasjon

Først lastet jeg ned [nyeste ISO-versjon av Proxmox](https://www.proxmox.com/en/downloads), som jeg «flash-et» til en minnepenn med balenaEtcher og deretter bootet fra på serveren.

### Svart skjerm
Installasjonen startet, men det ble en kortvarig glede. Skjermen gikk i svart. Gang på gang. Jeg konkluderte med at Proxmox ikke var kompatibel med maskinen, og prøvde Debian. Det samme skjedde. Da tenkte jeg at skjermkortet (AMD FirePro D500) var årsaken, og startet søkingen etter svar.

Et [forum på MacRumors](https://forums.macrumors.com/threads/linux-on-a-2013-mac-pro.2439072/) satt meg på sporet. Der kom jeg over noe som heter `nomodeset`. Det er en kjerne-parameter som forteller systemet at video-driverne ikke skal lastes før systemet har bootet ferdig. Da fungerte det! Denne, og andre parametre, kan angis i boot-menyen via `e`-tasten.

### Nettverk

Når det kommer til nettverk så har jeg mye å lære. Første gang jeg installerte Proxmox hadde jeg ikke satt i nettverkskabelen, og jeg klikket kjapt videre på bildet «management network configuration» som bestemmer nettverksinnstillinger. Resultatet ble et OS uten internett.

Jeg starter derfor på nytt, og prøvde å sette meg inn i hva de ulike innstillingene betyr, og gjør.

- Management interface: Dette er nettverkskortet på maskinen, som Proxmox finner selv. Den viser MAC-adressen.
- Hostname: Navnet på maskinen og nettverket. Jeg valgte `homelab.local`. 
- IP Address: Serverens IP-adresse. Jeg valgte `192.168.1.120`.
- Gateway: Dette er IP-adressen til ruteren min, 192.168.1.1. Den må angis for at serveren skal kunne koble seg til internett.
- DNS: Navnetjeneren kan settes til 192.168.1.1 som vil si at den bruker ruterens innstilling, eller man kan angi 8.8.8.8, som er Google sin.

Med disse innstillingene kom jeg meg på nett, noe jeg verifiserte med `ping`:

```bash
ping -c 3 192.168.1.1      # Test om internett fungerer
ping -c 3 google.com   # Test om DNS fungerer
```

Jeg sjekket også øvrige nettverksinnstillinger:

```bash
# Se alle nettverksinnstillinger
ip addr show

# Se gateway
ip route show

# Se DNS-servere
cat /etc/resolv.conf

# Se hostname
hostname
hostname -f  # viser full hostname (FQDN)

# Se hele nettverkskonfigurasjonen
cat /etc/network/interfaces
```

Grunnleggende oppsett var nå fullført, og jeg kunne koble meg på serveren via `root@192.168.1.120`, eller via nettleseren på adressen 192.168.1.120:8006

## Steg 2: Oppsett av virtuell maskin

For å installere en Linux-distribusjon måtte jeg først opprette en virtuell maskin i Proxmox. Det kan enkelt gjøres via det grafiske grensesnittet, men jeg ønsket å prøve via terminalen. Jeg sjekket dermed manualen til `qm`, Proxmoxs verktøy for håndtering av virtuelle maskiner:

```text
- qm list: Se VM-er
- qm create: Opprett VM
- qm destroy: Slette en VM
- qm set: Kommando for å endre en VM
	- --name: Angi navn
	- --memory: Angi minne
	- --cores: Angi CPU-kjerner
	- --net0: Angi virtuelt nettverkskort
	- --ostype: Angi hint om OS man ønsker å installere. Sørger for at drivere, innstillinger og CPU-flagg optimaliseres.
	- --scsi0: Legg til en virtuell disk
	- --ide2 [FILBANE],media=cdrom: Opprett virtuell maskinvare som CD-ROM 
	- --boot order="ide2;scsi0": Angir ønsket boot-rekkefølge på VM
	- --serial0: Angi serialport
- qm start: starte en VM
- qm stop: Stoppe en VM
```

Oppsettet ble dermed som følger:

```bash
# Opprett en ny VM (ID 100, navn "ubuntu-server")
qm create 100 --name ubuntu-server --memory 4096 --cores 2 --net0 virtio,bridge=vmbr0

# Legg til disk
qm set 100 --scsi0 local-lvm:32
```

Dette er en ganske standard VM, med fire GB RAM, to kjerner og 32 GB harddisk. Noen av disse innstillingene krevde derimot litt ekstra undersøkelse. 

### net0

Jeg stusset på betydningen av flagget `--net0 virtio,bridge=vmbr0`. 

`net0` betyr rett og slett første (virtuelle) nettverkskort til VM-en. Man kan opprette flere med 'net1', 'net2' og så videre.

`virtio` (virtualization I/O driver (virtIO)) er en drivertype for nettverkskortet som visstnok skal gi en mye bedre ytelse enn emulert maskinvare («hardware»).

`bridge=vmbr0` angir hvilken virtuell nettverkssvitsj VM-en skal benytte. I dette tilfellet er det `vmbr0`, som er standarden som opprettet under installasjon av Proxmox.

#### Hvordan fungerer det?
```text
Min VM (net0 - virtio) 
    ↓
vmbr0 (virtuell bridge i Proxmox)
    ↓
Fysisk nettverkskort på Mac-en
    ↓
Router/nettverk
```

Med dette oppsettet får VM-en sin egen IP-adresse. Den kan kommunisere med andre enheter på nettverket og kan nås fra andre maskiner (hvis man åpner porter).

### scsi0

```bash
# Legg til disk
qm set 100 --scsi0 local-lvm:32
```

`scsi0` betyr at vi ønsker å opprette en virtuell SCSI-harddisk for VM-en. `scsi0` er en SCSI-kontroller (interface-type), mens blokk-enheten er selve disken som blir opprettet under `dev/pve/vm-100-disk-0'. VM ser denne som `/dev/sda` eller `/dev/vda`. 

Grunnen til å bruke SCSI i steden for IDE er at førstnevnte er mer moderne og raskere, noe som dermed gir økt ytelse. 

`local-lvm:32` betyr at vi ønsker å opprette en disk på 32 GB, fra Proxmoxs virtuelle disk pool. `lvm` står for «Logical Volume Manager», og er et foretrukket verktøy for disk-oppsett.

Ønsker man å sjekke hvor mye plass det er tilgjengelig i hardisk-poolen, kan man benytte kommandoen `pvesm status` fra Proxmoxs «Proxmox VM Storage Manager».

Nå hadde jeg altså en tom virtuell maskin, klar for installasjon av Ubuntu Server.

## Installasjon av Ubuntu på virtuell maskin

Først lastet jeg ned nyeste ISO-fil av Ubuntu server. Deretter gjorde jeg en ny feil, ved at jeg «flashet» ISO-filen til minnepennen. Det blir ikke riktig i dette tilfellet.

ISO-filen skal kopieres som den er, over i Proxmox og dens standard katalog for ISO-filer: `/var/lib/vz/template/iso/`. Men først måtte minnepennen monteres, slik at jeg kunne få tak i innholdet.

Jeg inspiserte USB-enheter med `lsusb`, og fant: `Bus 002 Device 002: ID 0781:5581 SanDisk Corp. Ultra`. Deretter identifiserte jeg den med `lsblk`, og fant `sdb1`.

Så laget jeg en mappe for montering, som jeg deretter koblet minnepennen mot:

```bash
mkdir -p /mnt/usb 
mount /dev/sdb1 /mnt/usb
```

Etter at ISO-filen ble kopiert over til Proxmox-katalogen for ISO-filer, koblet jeg den til VM-en jeg hadde opprettet på følgende måte:

```bash
# Legg til CD-ROM med ISO
qm set 100 --ide2 local:iso/ubuntu-22.04-server.iso,media=cdrom

# Sett boot-rekkefølge (boot fra CD først)
qm set 100 --boot order=ide2;scsi0
```

Først opprettet jeg en virtuell CD-ROM med `ide2`, som er en historisk standard for optiske medier, og koblet den mot ISO-filen jeg hadde kopiert over. `media=cdrom` angir at dette skal være en CD-ROM, som er «read only» og mulig å fjerne.

Så satt jeg `ide2` som første enhet å boote fra, etterfulgt av harddisken, med `--boot order`.

Til slutt startet jeg den virtuelle maskinen med `qm start 100`, gikk over til Proxmox sitt grafiske grensesnitt i nettleseren, inn på den oppstartede VM-en, og fullførte installasjonen av Ubuntu.

Da det var gjort, oppdaterte jeg OS-et med `sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y`, sjekket nettverk, og kom inn på VM-en via SSH.

Alt fungerte!
