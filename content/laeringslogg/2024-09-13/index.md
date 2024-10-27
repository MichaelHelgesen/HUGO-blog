---
title: 2024-09-13
date: 2024-09-13
laeringsemner: [linux, bash]
---

## Linux
* For å se alle installerte «packages»: `dnf list installed`.

## Bash
* «wildcards» er nyttige for søk.
* `*`: matcher ingen eller flere tegn.
* `?`: matcher kun ett tegn.
* `[abc]`: kaller «character class». Matcher en av tegnene mellom klammene.
* `[!abc]`: Matcher alle tegn som ikke er mellom klammene.
* `[1-10]`: Kalles «range» og matcher alt mellom to parametre, for eksempel `[1-10]` eller `[B-T]`.
* Det finnes mange predefinerte «wildcards» som `[[:alpha:]]`, `[[:digit:]]`, `[[:upper:]]` og så videre.
* Overse «wildcard» med `\`.
