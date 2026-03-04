---
title: Fra markdown til JSON
date: 2026-01-02
tekstemner: [node, programmering]
serier: [node]
listeintro: "Jeg utvikler to-do applikasjonen til å bruke JSON fremfor markdown-filer for enklere kode."
Description: "Jeg implementerer JSON"
ingress: "Jeg implementerer JSON"
draft: true
---

I forrige Node-innlegg gjorde jeg meg kjent med `fs`-metoden i Node, for filbehandling. Jeg endte opp med fire filer til sammen: ferdige oppgaver pluss backup, og uferdige oppgaver pluss backup.

Med JSON kan vi redusere dette til to, ved å konvertere oppgavene fra enkle tekststrenger til Javascript-objekter, med utfyllende informasjon.

## JSON

Javascript Object Notation (JSON) er en metode for å transportere data som strukturert tekst, og brukes mye i web-applikasjoner som å sende informasjon mellom en server og en klient. Slik sett passer det perfekt for mi lille to-do-app.

Det er et standardformat som er basert på Javascript, men er i seg selv et spåk-uavhengig format som de fleste programmeringsspråk støtter.

JSON bygger på to datastrukturer som er "nøkkelpar" og lister (arrayer). Det er gangske enkelt sammenlignet med for eksempel XML, og resulterer i raskere overføringer og mindre filstørrelser.

Formatet ble opprinnelig spesifisert av Douglas Crockford tidlig på 2000-tallet, og støtter følgende datatyper:

- Tall
- Tekst (String)
- Boolske verdier
- Tabeller
- Objekter (nøkkel:verdi-par)
- null (tom verdi)

Å lagre to-dos i JSON gir langt mer fleksibilitet, sammenlignet med å registrere dem som énlinjet streng, og holde styr på dem basert på indeks. Jeg kan inkludere mer informasjon, samt ha både utførte og uferdige oppgaver i en og samme fil, som enkelt kan filtreres basert på for eksempel status.

Så første steg var å bestemme hva to-do-objektet skulle inneholde. Jeg landet på følgende:

```js
{
    "createdDate": new Date().toISOString().split("T")[0],
    "id": Date.now(),
    "task": task,
    "done": false
}
```

- `createdDate`: Dato for opprettelse. Jeg valgte å fjerne tiden med split, slik at jeg kun satt igjen med datoen.
- `id`: Unik ID basert på dagens dato ned til millisekunder
- `task`: Oppgaven
- `done`: Status

Jeg erfarte også at JSON er litt strengere med syntaksen. Jeg hadde nemlig komma bak siste nøkkelpar, og da feilet koden. 

## En liste med objekter

En JSON-fil kan enten starte med et objekt eller en liste på toppnivå. Det betø at jeg måtte legge opp til en ny fil `tasks.json` i koden, dersom den ikke allerede eksisterer. Og jeg måtte sørge for at den starter med en liste `[]`.

```js
const fs = require("fs");
const tasksFileName = "tasks.json";
let taskObjects;

// Validate file
function validateFile() {
  // create file if it doesnt exist
  if (!fs.existsSync(`./${tasksFileName}`) || fs.readFileSync(tasksFileName, "utf8") === "") {fs.writeFileSync(tasksFileName, "[]")};

  taskObjects = JSON.parse(fs.readFileSync(tasksFileName, "utf8"));
}

```

Jeg kunne kvitte meg med `trim` og `split` som jeg hadde tidligere, fordi Nodes innebygde JSON-metode `JSON.parse` fikser det for oss. Den konverterer tekst til objekter, og omvendt med `JSON.stringify()`. Disse metodene er for øvrig også innebygd i Javascript, og til og med i nettleseren.

## Objekt-generator

Neste steg var å lage en funksjon som konstruerte objekter basert på innkommende oppgave via `add`-argumentet:

```js
function taskObjectGenerator(task) {
  const object = {
    "createdDate": new Date().toISOString().split("T")[0],
    "id": Date.now(),
    "task": task,
    "done": false
  }
  taskObjects.push(object);
  writeFile();
};
```

Jeg oppdaterte også `writeFile`-funksjonen til å konvertere tilbake fra JSON-objekt til streng:

```js
// write files
function writeFile() {
  fs.writeFileSync(tasksFileName, JSON.stringify(taskObjects, null, 2));
}
```

## Presentere oppgaver

Jeg fortsatte med `listTasks`-funkjsonen som kunne forenkles en del. Også her fjernet jeg `trim` og `split` til fordel for `filter`.

```js
// list tasks
function listTasks() {
  const unfinishedTasks = taskObjects.filter(obj => !obj.done);
  const finishedTasks = taskObjects.filter(obj => obj.done);

  console.log("Oppgaver som venter:")
  if (!unfinishedTasks.length) {
    console.log("0")
  } else {
    unfinishedTasks.forEach(({id, task}, index) => {
      console.log(${index + 1}. [ ] ${task});
    })
  }
  console.log("\nOppgaver som er gjort:")
  if (!finishedTasks.length) {
    console.log("0")
  } else {
    finishedTasks.forEach(({id, task}, index) => {
      console.log(${(index + 1) + unfinishedTasks.length}. [x] ${task});
    })
  }
}
```

## Endre status på oppaver

Neste på listen var funksjonen for å endre status på en oppgave. Også denne kunne forkortes betraktelig ettersom jeg hadde gått over til objekter:

```js
// check or uncheck task
function checkTask(status) {
  const unfinishedTasks = taskObjects.filter(obj => !obj.done);
  const finishedTasks = taskObjects.filter(obj => obj.done);

  (status ? unfinishedTasks : finishedTasks).forEach((obj, index) => {
    if ((status ? secondArg : (secondArg - unfinishedTasks.length)) == index + 1) {
      obj.done = !obj.done;
    }  
  }); 
  console.log(`Marker oppgave ${secondArg} som ${status ? "ferdig" : "uferdig"}`);
  writeFile();
}
```



**INFO**
Det kan være nyttig å minne om referanser vs. verdier i Javascript. Primitive verdier som tall, strenger og bool kopieres når de tilordnes. Det gjelder ikke objekter og lister. Vi får en referanse til minnet hvor originalen befinner seg. Så en variabel med en filtrert liste inneholder ingen "ekte" verdier selv, men henvisninger til målvarianten. 



Oppstart — resonnering om JSON

Du resonnerte deg selv frem til at én JSON-fil var bedre enn to
Du foreslo objektstruktur med ID, dato, tittel og done
Spørsmål om object factory og JavaScript-konsepter

JSON-syntaks — prøving og feiling

Første forsøk manglet { på andre objekt
Andre forsøk: nøkler uten anførselstegn
Tredje forsøk: trailing comma etter siste objekt
Fjerde forsøk: glemte done-feltet
Innsikt: JSON er strengere enn vanlig JavaScript-objekter

ID-strategi

Først foreslått index som ID
Innsikt: index er ikke stabilt når man sletter
Løsning: intern unik ID (Date.now()) + visningstall basert på index
Kombinasjon gir både robusthet og brukervennlighet

validateFile()

Innsikt: trim().split("\n") er unødvendig med JSON
Tom fil må inneholde [] for at JSON.parse() skal fungere
Funksjonen ble betydelig enklere enn originalen

writeFile() og JSON.stringify

Første versjon: stringify skjedde inne i taskObjectGenerator
Problem: taskObjects ble en streng istedenfor array
Innsikt: stringify hører hjemme i writeFile() — separasjon av ansvar
Første fungerende versjon hadde objekter som strenger i JSON-filen

Globale vs. lokale variabler

unfinishedTasks og finishedTasks startet som globale
Innsikt: de er bare utledede verdier fra taskObjects
Beslutning: flytte dem lokalt inn i hver funksjon

Referanser vs. verdier

Oppdaget at filter ikke kopierer objekter
Innsikt: å endre obj.done i en filtrert array oppdaterer også taskObjects
Dette er et av de viktigste JavaScript-konseptene i samtalen

deleteTask()

Løst elegant med spread og filter
Diskusjon om rekkefølge måtte matche listTasks()

Dato-format

Date.now() for ID
Vurderte norsk format 23.2.2026
Innsikt: ISO 8601 (2026-02-23) er universalt og sorterbart
Løsning: toISOString().split("T")[0]

Strategidiskusjon

Fortsette med samme app vs. nytt prosjekt — konklusjon: samme app hele veien
Rekkefølge: Express → database → TypeScript → React/Next.js
Linux/bash læres parallelt gjennom hosting
Katalogiseringsapp blir første "ekte" prosjekt etter todo
