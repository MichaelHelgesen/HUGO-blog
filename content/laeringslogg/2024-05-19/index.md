---
date: 2024-05-19
title: 2024-05-19
laeringsemner: [hugo]
---

## Hugo 
* Jeg fant ut at HUGO ikke har støtte for «regular expressions» «look ahead» eller «capture groups». Jeg måtte derfor dele opp prosessen med å hente ut tekst fra en artikkel.
1. Måtte først lage en regex-streng med ``$regExString := print `(?s)(?i)` $tag `<\/h[0-9]>.*?<h[0-9]|(?s)(?i)` $tag `<\/h[0-9]>.*` ``   
    * `(?s)` betyr «single line mode» og ignorerer «whitespace» inkludert mellomrom, tabulator og ny linje.
    * `(?i)` betyr at det ikke tas hensyn til om bokstavene er minuskler eller versaler.
    * `|` betyr enten det før eller etter `|` (pipe). Får den ikke treff på søket før `|`, så søkes etter det på høyre siden.
2. Deretter lage en variabel av søket.
    * `{{ $regExMatch := .Content | findRE $regExString }}`
3. Av punktet over fikk jeg en liste med treff som deretter måtte itereres over `{{ range $regExmatch }}`.
4. Deretter måtte jeg opprette en ny regex for å luke bort uønsket HTML-kode.
```html
{{ range $regExMatch}}
    {{ $contentMatch := . | findRE `(?s)<ul>.*?<h|(?s)<ul>.*`}}
    {{ $content := strings.TrimRight "<h" (index $contentMatch 0)}}
    {{ $content | safeHTML}}
{{ end }}
```
* En navigasjonsmeny defineres i `config.toml` i HUGO:
```toml
[menus]
    [[menu main]]
        name = "Hjem"
        pageref = "/"
        weight = 10
```
* Menyen kan vises i maler på følgende vis: `{{ range site.Menus.main }}`. Med `{{- if $page.IsMenuCurrent "main" . }}` kan vi gi en menyelement en egen klasse om det er den aktive siden. Og med `$page.HasMenuCurrent "main"` kan vi gi sørge for at toppnivået i menyen får en egen klasse, selv om vi er på en underside.
