---
title: "2024-04-26"
date: 2024-04-26
laeringsemner: [hugo, design, nvim]
draft: false
---
## Hugo

* Det finnes ikke noe tilsvarende javascripts `switch` i Hugo. Man må bruke `if else` eller `with`.
* `with` endrer konteksten av "dott" til et uttrykk ("expression") og utfører kodeblokken dersom uttrykket er sant.
* Man kan begrese antall poster i `range` med tall:
    * Med `where` kan man "pipe" eller hekte på nummeret til slutt: `{{ where EXPR | 5 }}`.
    * Med `range` bruker man `first`-nøkkelordet: `{{ range first 5 . }}`
* `if and` i hugo defineres på følgende måte: `{{ if and (eq EXPR) (eq EXPR) }}`
* `.Kind` i Hugo returnerer typen side, for eksempel `home` `page` `term` og lignende.

## Design

* Jeg lærte meg at akronymet "CRAP" i design står for:
    * contrast
    * repetition
    * alignment
    * proximity

## VIM

* For å lukke en bufferfil, så skriver man `:bd`.

