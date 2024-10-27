---
title: 2024-09-09
date: 2024-09-09
laeringsemner: [linux, bash]
---
## Linux
* For å kjøre en prosess og se dens ID kan vi legge til `&`. For eksempel `hugo server &`. Tegnet indikerer at prosessen skal kjøre i bakgrunnen, i et «subshell». Prosessen må dermed gjerne termineres med «kill PROSESS-ID».
* For å se informasjon om en prosess kan vi skrive `ps -fp PROSESS-ID`. `-f` viser ekstra informasjon, mens `-p` lar oss filtrere på ID. 
## Bash
* Et Bash-script er et kommandolinjeprogram som inneholder kommandoer som leses av en interpreterer. For shell-scripter er det shell som er interpreter.
* Alle kommandoer som kan kjøres i kommandolinjen kan også kjøres i et shell-script. Bash-script er et shell-script.
* Alle bash-script starter med `#!/bin/bash`. `#!` kalles «shebang», og følges av banen til interpretereren. Scriptet blir sendt til interpretereren som et argument.
* For å kjøre et script må vi først gi tilgang ved å angi for eksempel `chmod 755 script.sh`.
* For å kjøre et script kan vi skrive `./script.sh` eller bare `script.sh` om det er gjort tilgjengelig på systemnivå.
* Variabler angis uten mellomrom og angis som regel med store bokstaver: `VARIABEL="Hei"`.
* For å henvise til en variabel: `$VARIABEL_NAVN`.
* Man bruker krøllparentes rundt en variabel om man ønsker å legge til noe rett etter variabelen: `${VARIABEL}-`.
* Vi kan også definere en variabel med resultatet av en kommando ved å angi kommandoen i parentes: `VAR=$(KOMMANDO)`.
*Variabler kan ikke starte med tall, inneholde spesielle tegn eller ha bindestrek.
* For å sjekke om noe er sant eller falskt kan vi «teste» ved å angi påstanden i klammer `[ -d ]` eller ved å skrive «test»: `test -d`. Se manualen `man test` for mer.
* If / else:
```bash
if [ condition ]
then
    commando
elif [ condition ]
then
    commando
else
    commando
fi
```
* For-løkke:
```bash
for ITEM in LIST
do
    commando
done
```
* Posisjonelle parametre refereres med `$1 $2 $3` og så videre. `$0` henviser til selve scriptet.
* Alle parametere kan samles i en liste med `$@`.
* For å be om inndata fra bruker: `read -p "PROMPT" VARIABEL`. «Prompt» er teksten som skal vises i kommandolinjen, og «VARIABEL» er navnet på variabelen som lagrer inndataene.
* Alle kommandoer har en «exit-status» eller «exit-kode» fra 0-255. 0 er suksess.
* For å se en kommandos statuskode skriver man `$?` rett etter kommandoen.
* `&&` betyr «og», mens `||` betyr «eller».
* Vi kan bruke semikolon for å lenke flere kommandoer. Alle kjøres uansett foregående kommandos statuskode.
* Vi kan angi en statuskode manuelt for å spesifisere spesifikke statuser.
