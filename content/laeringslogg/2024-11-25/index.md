---
title: 2024-11-25
date: 2024-11-25
laeringsemner: [csharp]
---
## Csharp
- `using system` gjør at vi kan bruke kode som tilhører «system»-gruppen («namespace»). Da slipper vi for eksempel å skrive `System.Console.WriteLine()`. Det holder med `System.Console.WriteLine()`.
- Hvis verdiene i en array mest sannsynlig ikke vil endres, kan de defineres sammen med arrayen. Hvis det motsatte angir man heller antallet variabler arrayen skal ha.
```csharp
int[] numbers = [3, 5, 6]; // Om verdiene ikke skal endres
int[] numbers = new int[3] // Om verdiene er ukjente
```
- Nøkkelordet `continue` forteller en array å umiddelbart gå til neste iteration.
