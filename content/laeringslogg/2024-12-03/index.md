---
title: 2024-12-03
date: 2024-12-03
laeringsemner: [csharp]
---
## csharp
- `Array.Sort()`: sortere array.
- `Array.Reverse()`: reversere array.
- `Array.Clear(arr, startindex, antall)`: fjerner innhold og setter null for streng og 0 for int. Fjerner kobling til minnet. Sjekk for null om mistenker dette.
- `Array.Resize(ref arr, antall å utvide / slette): legger til og sletter fra slutten. ref betyr å henvise til referanse fremfor selve verdien (standard).
- String.ToCharArray(): Streng til array med char. Kan bruke `new string(arrOfChar)` for å endre array av char til streng.
- `String.Join(",", arr)`: Lager streng av array med char og inkluderer separator.
- `arr.split(",")`:Deler streng til array av strenger. Velg hva som skal indikere splittingen. Splitten blir ikke med i array.
- Beste måten å tømme en array for tomme elementer er å iterere med counter for hver element med noe. Lag ny array med størrelse på counter. Loop gjennom original og kopier over alle ikke null til ny array.
