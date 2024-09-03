---
title: 2024-08-20
date: 2024-08-20
laeringsemner: [cloudinary, linux, direnv, hugo]
---
## Cloudinary
* For å hente bilder fra en spesifikk mappe via API i HUGO kan man bruke følgende streng:
```text
{{ $url := print "https://" $cloudinary_key ":" $cloudinary_secret "@api.cloudinary.com/v1_1/" $cloudinary_name "/resources/search?expression=folder:" $cloudinary_folder " }}
````
* For sortering, begrensning på antall og utvalgte datafelter kan man gjøre som følger:
```text
{{ $url := print "https://" $cloudinary_key ":" $cloudinary_secret "@api.cloudinary.com/v1_1/" $cloudinary_name "/resources/search?expression=folder:" $cloudinary_folder "&max_results=" .number "&sort_by[][created_at]=desc&&fields[]=width&fields[]=height&fields[]=url&fields[]=filename&fields[]=context" }}
```

## Linux
* For å se hvilken versjon av BASH man kan man skrive `echo "$SHELL"` i terminalen.
* BASH-filen ligger som regel i «home»-banen.

## direnv
* For å beskytte nøkler, passord og e-poster kan de erstattes med ENV-variabler i applikasjonene våre. Slik jeg forsto det hadde ikke HUGO noen innebygd funksjon for dette. Etter søking fant jeg [direnv.net](https://direnv.net/)
* direnv er en utvidelse til «shell» i Linux som aktiverer og sletter variabler basert på hvilken mappe man navigerer til. Fungerte veldig bra.

## Hugo
* For å gi HUGO tilgang til eksterne ENV-variabler må det aktiveres i `hugo.toml`. 
```toml
[security]
    [security.funcs]
        getenv = ['^HUGO_', '^CI$', '^USERS$', '^HOME$']
```
* For å få tilgang i «templates»: `{{ getenv "HUGO_secret}}` hvor «HUGO_secret» er navnet på ENV-variabelen. 
