---
title: 2024-11-20
date: 2024-11-20
laeringsemner: [c#]
---
## C\#
- `Console.Write("Hello World!");` printer ord.
- `Console.WriteLine("Hello World!");` printer ord og legger til ny linje. 
    - `Console`er en klasse, og `Write` er en metode. Punktum i mellom klasse og metode kalles "member access operator".
    - Parentesen kalles "method invocation operator".
- Ord mellom anførselstegn kalles "sting literal".
- C\# krever semikolon for å fortelle at kommandoen skal avsluttes.
- Enkle anførselstegn `'A'` indikerer "char", altså én enkelt karakter. Kalles "character literal".
- Hele nummer, "int literal", skrives uten anførselstegn.
- Desimaltall, "floating point, har tre typer.
    - `float`: 6-9 tall. Bruker "literal suffix" `f` eller `F` `0.25F`. 
    - `double`: 15-17 tall. Ingen "literal suffix". Tall med desimal og uten suffiks er automatisk en `double`.
    - `decimal`: 28-29 tall. Bruker suffiks `m` eller `M` `12.381m`.
- Bool defineres som `true` eller `false`. Kalles "bool literal".
- C\# er "strongly typed language". Det legges stor vekt på datatyper for å unngå bugs.
- `var` brukes for implisitt definisjoner av variabler. C\# ser hva som følger etter likhetstegnet og låser typen for oss. 
    - `var message = "Hello"` låses til "sting literal".
    - `var` må initieres. Kan ikke ha tom definisjon som `var message`.
