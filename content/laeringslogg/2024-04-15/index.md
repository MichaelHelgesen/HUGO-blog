---
title: 2024-04-15
date: 2024-04-15
laeringsemner:
- hugo
---
## Hugo
* Man **looper gjennom sider** i Hugo med `{{ range .Site.RegularPages }}`. Det er det samme som en `for loop` i javascript.   
    * **`.Site`** er forøvrig en **global funksjon** som gir **tilgang til gjeldende "site"**, som omtales som et objekt i dokumentasjonen.  
Man kan bruke både `site` og `.Site`. Hugo anbefaler å benytte `site` i "templates".  
    * **`.RegularPages`** er en "site"-metode som **returnerer en samling ("collection") av alle standard-sider**.
* **Variabler i Hugo** angis på følgende måte: `{{ $name := "Mikke" }}`. 
* **`{{ PAGE.RawContent }}`** returnerer **innholdet på en side som rå tekst**, uten "frontmatter" og kode.
* **"if-statement"** i Hugo:
```GO
{{ if STATEMENT }}
    ...
{{ end }}
```
* **Slå sammen variabel og streng:** `print "Hello" $name "!"`. 
* **`in`:** Sjekke om en **angitt verdi finnes i en samling**, som kan være array, slice eller string. `{{ if in $l (print "< ref \"" $o "\" >") }}`.
