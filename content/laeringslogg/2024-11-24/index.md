---
title: 2024-11-24
date: 2024-11-24
laeringsemner: [csharp]
---
## Csharp
- Array er en samling av samme type data. Man må angi datatype og størrelse på array:
```
string[] ordreID = new string[3];
```
- Det er også mulig å angi en array på følgende måte:
```Csharp
string[] id = ["B13", "B45", "B67"]; // Innført i C# 12
string[] id = {"B13", "B45", "B67"};
```
- `foreach` brukes til å iterere over elementer i en array:
```Csharp
foreach (string id in ids)
{
    
}
```
