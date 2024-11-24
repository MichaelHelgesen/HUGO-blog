---
title: 2024-11-23
date: 2024-11-23
laeringsemner: [csharp]
---
## Csharp
- Klasser («class») kan sees på som en container med en masse metoder.
- «Statefull vs stateless» metoder:
    - «State» refererer til en status eller en tilstand av kjøremiljøet til en hver tid. Noen metoder er avhengig av denne tilstanden, andre ikke. Vi kan kanskje kalle dem statusavhengig eller tilstandsavhengig og statusuavhengig eller tilstandsuavhengig. Men de omtales også som statiske og instans-metoder, noe som er litt kortere og kanskje enklere å huske.
    - Statiske metoder er ikke avhengig av variabler lagret i minnet, og skaper ingen endringer i programmet. Et eksempel på dette er `Console.WriteLine()`.
    - Instans-metodene derimot lagrer verdier eller data, og opprettholder derfor en form for tilstand mellom hvert kall. Eksempel:
```Csharp
public class Teller
{
    private int _teller = 0;

    public int OkTeller()
    {
        _teller++;
        return _teller;
    }
}
```
- I og med at instans-metodene skal holde styr på verdier mellom kjøringen må de ha egne variabler som kan lagre data. Det er derfor vi må opprette en instans per unike klasse før vi utfører kjøringer. Grunnen til det er at vi må ha plass i minnet for å holde på de ulike variablene.
- En instans av en klase kalles et objekt, og opprettes med `new`-nøkkelordet.
```Csharp
Random dice = new Random();
```
- I eksempelet over oppretter vi en ny instans av klassen `Random`. Det kalles å opprette et objekt. Dette objektet får en minneadresse og dermed egen «state» eller tilstand. Denne minneadresen kobler vi til variabelen `dice`.
- Metoder: 
    - Metoder som ikke returnerer noe kalles «void»-metoder.
    - Argumenter er variabler som sendes til en metode, mens parametre er variabler som benyttes inne i metoden.
    - Overlastede metoder («overloaded methods») er metoder som kan motta ulike antall argumenter, og gjerne i ulik rekkefølge. De kan altså kalles på ulike måter. De kan også returnere ulike typer data basert på kallet. De gjør ulike ting basert på argumentene den mottar. Eksempel:
```Csharp
Console.WriteLine(); // Ingen argumenter.
Console.WriteLine("Hei"); // Streng som argument.
Console.WriteLine(num); // Variabel av typen «int» som argument.
```
