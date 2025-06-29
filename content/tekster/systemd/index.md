---
title: "Hva er initieringssystemet «systemd»"
date: 2025-06-29
tekstemner: [linux]
ingress: Hva er «systemd», og hvordan fungerer det?
listeintro: Hva er «systemd» i Linux, og hvordan fungerer det?
Description: Hva er «systemd» i Linux, og hvordan fungerer det?
draft: false
---

I Linux er «init»-systemet det første programmet som kjøres når maskinen har fullført oppstart ("boot" / "after kernal"). Oppgaven til "init" er å starte alle andre tjenester og prosesser som trengs for at operativsystemet skal fungere som ønsket. 

"systemd" er et slikt init-system. I tillegg er det en såkalt "system manager", som kan kontrollere systemet under bruk.

"systemctl" er den sentrale kommandoen for å kontrollere "init"-systemet:
	- håndtere tjenester
	- sjekke statuser
	- endre systemtilstander

"systemd" kan operere på spesifike enheter eller ressurser som "systemd" vet å håndtere. Disse enhetene er kategorisert etter type og er definert som såkalte "unit files". Enhetstypen kan avleses via suffikset i enden av filen. Eksempel `.service` som indikerer en service-enhet. Man kan ofte sløyfe suffikset, da "systemd" er smart nok til å forstå at du ønsker å operere på en tjeneste når du bruker "service management"-kommandoer.

```text
sudo systemctl start application.service
```

Kan skrives som 

```text
sudo systemctl start application
```
## Status-kommandoer
- `start`: starte en tjeneste.
- `stop`: stoppe en tjeneste.
- `restart`: starte på nytt og laste inn konfigurasjonsfiler på nytt.
- `reload`: hvis mulig laste inn konfigurasjonsfiler uten å starte på nytt.
- `enable`: angi at en tjeneste skal starte hver gang maskinen booter.
	- Dette lager en symlink av systemets fil for tjenesten (ofte i `/lib/systemd/system` eller `/etc/systemd/system`) og plasserer den i en mappe hvor systemet ser etter autostart-filer, ofte `/etc/systemd/system/sometarget.target.wants`
- `disable`: fjerner tjeneste fra oppstart.
- `status`: sjekke status på tjenesten.
	- gir deg status, linuxcgroup | CGroup og de første linjene fra loggen.
- `is-active`: enkel ja / nei
- `is-enabled`: enkel ja / nei
- `is-failed`: enkel ja / nei
##  Oversikt over systemstatus
- `list-units`: se liste over alle aktive enheter som "systemd" har aktivert og dermed kjenner til.
	- Kolonner: enhet, load, active, sub (slags dypere status), description.
	- Flagg:
		- `--all`: se alle, ikke bare aktive
		- `--state`=: status f.eks. "inactive"
		- `--type`: type f.eks. "service"
	- MERK: Det kan synes en mengde `.device`-filer i oversikten. Slik jeg forstår det er ikke dette faktiske filer. Det er noe som dynamisk opprettes i forbindelse med hardvare. De inneholder ingen data. De er kun en slags peker til hardvare som operativsystemet kan benytte. En slags liste over komponentene i maskinen. Derfor synes de ikke i `list-unit-files`, hvor det vises faktiske filer.
- `list-unit-files`: se alle enhetsfiler, selv de som ikke er aktivert.
## Unit management
- `cat [ENHET]`: se innholdet i fila.
- `list-dependencies`: Se avhengighetstre. Viser andre tjenester som den angitte trenger eller ønsker. Rekursive resultater vises bare for `.target`-enheter.
	- `--all` For å se alle rekursive resultater
	- `--reverse`: Se hva som er avhengig av angitt enhet.
	- `--before` og `--after`: Se andre enheter som er avhengig av at gjeldende enhet starter henholdsvis etter eller før dem selv.
- `show [ENHET]`: Liste med egenskaper.
	- `show [ENHET] -p [EGENSKAP]`: Viser spesifik egenskap.
- `mask`: Hindrer tjenesten i å starte automatisk, eller manuelt. Pekes mot `/dev/null`. Kalles å "maskere" en tjeneste.
- `unmask`: Fjerne fra "masked".
## Redigere enhetsfiler
- `edit [ENHETSFIL]`: Redigere filen.
	- Åpnes som `/etc/systemd/system/[ENHETSFIL].service.d/override.conf`. Denne filen kalles en "snippet" (utdrag), og slås sammen med originalen. Utdraget har presedens over originalen.
	- Flagg:
		- `--full`: Lar oss redigere den gjeldende filen. Endret fil vil lagres under `/etc/systemd/system`, og tar presedens over systemets enhetsdefinisjon som gjerne ligger under `lib/systemd/system`.
- Etter sletting av fil eller mapper bør `systemd` lastes på nytt med `systemctl daemon-reload`.
## Justere systemstatus (linuxrunlevel) med "Targets"
`.target` er spesielle enhetsfiler som beskriver en systemstatus eller et synkroniseringspunkt. De utfører ikke noe spesielt selv, men grupperer andre enheter sammen.

Det kan altså brukes til å sette systemet i spesifikke modus i likhet med linuxrunlevel. De fungerer som referansepunkt for når gitte funksjoner er tilgjengelige. Slikt sett kan vi spesifisere ønsket modus for hele systemet, fremfor de individuelle enhetene som trengs for å skape ønsket modus.

`swap.target` er et eksempel. Den brukes for å indikere at linuxswap | swap er klart til bruk. Enheter som er en del av denne prosessen kan synkroniseres mot `swap.target` ved å indikere i sine konfigurasjoner at de er `WantedBy=` eller `RequiredBy=` av `swap.target`.

Enheter som krever at `swap` er klar kan spesifisere det med `Wants`, `Requires=` og `After=` for å indikere arten av forholdet dem i mellom.

- `get-default`: Se standard "target"-fil.
- `set-default`: Angi en standard "target"-fil.
- `list-unit-files --type=target`: Liste alle tilgjengelige "target"-filer.
- `list-units --type=target`: Se alle aktive "targets".

I motsetning til linuxrunlevel |runlevel kan man ha flere "targets" aktive av gangen. Et aktivt "target" indikerer at `systemd` har forsøkt å starte alle enheter knyttet til gjeldende "target", og ikke forsøkt å avslutte dem igjen.

- `isolate [TARGET]`: Starter alle enheter assosiert med en "target" og stopper alle som ikke er en del av tilhørende avhengighetstre. Ligner på det å endre linuxrunlevel|runlevel. 

Hvis systemet opererer i et grafisk grensesnitt via `graphical.target`, kan man stenge dette til fordel for "multi-user" kommandolinje ved å endre systemets modus ved å isolere `multi-user.target`.  Det kan være lurt å se avhengighetslisten før man gjør dette, i tilfelle man stopper vitale tjenester: `list-dependencies [TARGET]`.
### Snarveier
Enkelte kommandoer har snarveier for å spare oss for litt tid. I steden for `systemctl isolate rescue.target` kan vi skrive `systemctl rescue`.
- `rescue`: "Single user"-modus.
- `halt`: Sette systemet på pause.
- `poweroff`: Skru av systemet.
- `reboot`: Restarte systemet.

Enkelte kommandoer lar oss også sløyfe `systemctl` og lar oss for eksempel bare skrive `sudo reboot`.

## Aktivere / deaktivere tjenester ved oppstart
- `enable [ENHET]`: Angir at en enhet skal starte ved oppstart.
- `disable [ENHET]`: Angir at en enhet skal deaktiveres fra å starte ved oppstart.
## Sjekke og tolke tjeneste-status
- `stats [ENHET]`: Se status for en enhet.
	- `Active`: Om den er aktiv, samt når den ble aktivert og hvor lenge den har vært aktiv.
	- `Loaded`: Tjenestefilens plassering og status.
	- `Process`: Kommandoen som brukes for å starte tjenesten, samt å avslutte den.
	- `Main PID`: Prosess-ID til hovedservice-prosessen.
	- `Status`: Kort beskrivelse av status.
	- `CGroup`: Liste av prosesser tilknyttet tjenesten.
## Vanlige feil or feilretting
Kommer du borti "unit not found" eller "failed to start unit" så er det viktig å verifisere navn, og at filen faktisk eksisterer og ligger på riktig sted, som `/etc/systemd/system/` eller `/lib/systemd/system/`. Det kan også være vi må sjekke filen for eventuelle syntaksfeil.

For å sjekke plassering og syntaks kan man skrive `sudo systemctl status httpd` og 
`sudo systemctl cat httpd`.
