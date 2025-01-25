---
title: 2024-12-02
date: 2024-12-02
laeringsemner: [csharp]
---
## csharp
- «Widening conversion» betyr å konvertere en datatype som kan romme mindre data til en type som kan holde mer data - implisitt konvertering.
- Typekonvertering («cast») kan utføres med «cast-operatøren» "()". `(int)myDecimal`.
- «Cast»-operatøren forteller C#-kompilatøren at du har kontroll på konverteringen, og at du forstår at du kan miste data. En eksplisitt konvertering utfører man ved en «narrowing».
- Hvis man er usikker på å miste data, så kan man utføre tester på to ulike måter for sjekke resultatene.
    - `ToString()`: tall til streng.
    - `Parce()`: Streng til tall, men `TryParce()` er bedre i tilfelle streng ikke kan bli tall.
    - `Convert.ToInt32()`: Streng til tall. Best for konvertering av desimal til hele nummer fordi den runder opp og ned på standard måte.
- «Casting» avkorter og «convert» avrunder.
- Det er ikke alle konverteringer som er lov, som streng til decimal.
