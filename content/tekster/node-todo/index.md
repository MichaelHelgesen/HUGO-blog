---
title: Utvikling i Node.js
date: 2026-01-02
tekstemner: [node, programmering]
serier: [node]
listeintro: "Jeg lærer meg Node.js, og starter med en «to-do»-app"
Description: "Jeg lærer meg Node.js"
ingress: "Jeg lærer meg Node.js"
draft: true
---

Som en utvidelse av mitt hobby-prosjekt med oppsett av egen hjemmeserver, har jeg også startet å lære Node.js. Det var et naturlig valg av språk når det kommer til «back-end» programmering, siden jeg har jobbet med Javascript i mange år som «front-end»-utvikler, og i det siste med fokus på Next.js og Sanity CMS, som begge er bygget på React. 

Jeg vurderte om jeg skulle benytte anledningen til å lære C#, Go, PHP eller noe annet, men å solidifisere og videreutvikle Javascript-kunnskapen min har også vært et ønske, så da falt det seg ganske naturlig å velge Node.

## Hva er Node.js?
Node.js er et kjøremiljø for Javascript. Det betyr at språket kan kjøres på servere og lokale maskiner, og ikke bare i nettleseren slik det opprinnelig var utviklet for. Det gjør det mulig å kjøre Javascript overalt. Det passer meg perfekt, siden jeg ønsker å utvikle serverprogrammer til eget behov, og ikke minst API-er og web-servere. Det kommer også med bred støtte, et aktivt utviklingsmiljø, og tusenvis av pakker via NPM («Node package manager»).

Node.js ble utviklet av Ryan Dahl og lansert i 2009. Det er bygget på Googles V8-JavaScript-motor (den samme som driver Google Chrome), en rask og asynkron løsning som kompilerer JavaScript direkte til maskinkode.

## TO-DO

Mitt første prosjekt ble en tradisjonell «TO-DO»-applikasjon, som jeg ønsket å koble til en fil for å bli kjent med Nodes filsystemhåndtering, i tillegg til innkommende argumenter.

Jeg startet med `process.argv`. Det er en liste («array») med alle argumentene fra kommandolinjen, i tillegg til programmet og skriptet som kjører. De to sistnevnte er alltid på plassene '[0]` og '[1]', med alle argumenter fra kommandolinjen som påfølgende.

1. `/usr/bin/node` - Programmet som kjører (Node selv)
2. `/home/mikke/repos/todo-cli/args.js` - Skriptet som kjører
3. `hei` - Argument fra kommandolinjen.

For å hente kun argumenter brukte jeg `slice`:

```js
process.argv.slice(2)
```

## Tolke kommandolinje-argumenter

Basert på `process.argv`s håntering av argumenter lyttet jeg etter kommandoene `add`, `list` og `done`, som henholdsvis skulle legge til en oppgave, vise alle oppgaver, og fullføre en oppgave:

```js
const args = process.argv.slice(2);
const firstArg = args[0];

if (firstArg === "add") {
  console.log("Legg til oppgave");
} else if (firstArg === "list") {
  console.log("List alle oppgaver")
} else if (firstArg === "done" && !isNaN(args[1])) {
  console.log(`Marker oppgave ${args[1]} som ferdig`)
} else {
  console.log("Ugyldig kommando")
}
```

Det fungerte fint. Neste steg ble å finne ut hvordan Node lagrer til fil.

## «File system»-modulen

Node har en innebygd modul `fs` for håndtering av filer, med en rekke funksjoner. For å lese og skrive til en fil, benyttes `fs.readFileSync` og `fs.appendFileSync`. Førstnevnte leser innholdet i en fil, og sistnevnte legger til i en fil. Dette er synkroniserte utgaver av funksjonene. Det finnes også «async»-versjoner, men de venter jeg litt med. Synkrone operasjoner var mer enn godt nok for mitt lille eksperiment.

### Lese en fil

```js
const fs = require('fs');

const content = fs.readFileSync('tasks.md');
console.log(content);
```

Resultatet av denne kommandoen er rådata: en såkalt buffer med binærdata som bits. En fil kan jo inneholde hva som helst, bilder, video, tekst eller annet, og det aner ikke Node noe om. Formatet må spesifiseres eksplisitt:

```js
const content = fs.readFileSync('tasks.md', 'utf8');
console.log(content);
```

Da vises det som forventet. 

Jeg lærte også at denne funksjonen presenterer hele innholdet, og ikke linje for linje. Man får derfor ingen linjenummer eller iterering å forholde seg til. Alt innhold presenteres som én lang streng.

Man må i tilfelle selv splitte den til en liste, finne riktig indeks, endre linjen, sette listen sammen til en streng igjen, og deretter skrive tilbake til fil.

### Skrive til en fil

For å skrive til en fil kan man benytte `fs.appendFileSync`. Denne funksjonen legger til data bakerst i en fil, og oppretter filen dersom den ikke allerede finnes.

```js
const fs = require('fs');

// Legg til en linje i tasks.md
fs.appendFileSync('tasks.md', '- [ ] Min første oppgave\n');

console.log('Oppgave lagt til!');
```

En viktig detalj her er `\n` på slutten, som indikerer linjeskift («newline»). Uten denne vil oppgavene havne på rekke i én lang linje.

## Endre en oppgave

Så langt har jeg funnet ut hvordan man legger til en oppgave via kommandoen `add`, og viser alle oppgavene med `list`.

Neste steg var å markere en oppgave som gjort. Det vil si at innholdet i linjen skulle endres fra `[ ] Kjøpe melk` til `[X] Kjøpe melk`.

Siden `fs.readFileSync` ikke itererer, blir prosessen som følger:

1. Lese hele filen
2. Splitte i linjer
3. Endre ønsket linje (for eksempel linje nummer 3)
4. Sette linjene sammen igjen
5. Skrive hele innholdet tilbake til filen

Så jeg måtte splitte opp `tasks.md`, endre, lagre til ny midlertidig variabel, og deretter overskrive `tasks.md` med det oppdaterte innholdet.

```js
const fs = require("fs");

const args = process.argv.slice(2);
const firstArg = args[0];

if (firstArg === "add") {
  const task = args.slice(1).join(" ")
  fs.appendFileSync("tasks.md", `- [ ] ${task}\n`)
  console.log("La til oppgave", task);
}
else if (firstArg === "list") {
  console.log("Alle oppgaver:\n");
  console.log(fs.readFileSync("tasks.md", "utf8"))
} else if (firstArg === "done" && !isNaN(args[1])) {
  console.log(`Marker oppgave ${args[1]} som ferdig`)
  let file = fs.readFileSync("tasks.md", "utf8").split("\n");
  let editedFile = [];
  file.forEach((task, index) => {
    if (Number(args[1]) === index + 1) {
      const changeIndex = task.indexOf("]")
      task = `- [x] ${task.slice(changeIndex + 2)}`
    }
    editedFile.push(task);
  });
  fs.writeFileSync("tasks.md", editedFile.join("\n"))
} else {
  console.log("Ugyldig kommando")
}
```

## Backup

Jeg syntes det hørtes skummelt ut å overskrive en fil som nevnt over. Hva om noe går galt, og dataene eller filen slettes? Jeg undersøkte dermed litt rundt en enkel backup. 

Målet er selvsagt en database, men nå nøyer jeg meg med å kopiere `tasks.md` til `tasks.md.bak` via `fs.copyFileSync` før jeg endrer noe. Da har jeg i det minste én mulighet for å tilbakestille dersom noe skulle skje.

```js
const fs = require("fs");

const args = process.argv.slice(2);
const firstArg = args[0];

// create a backup
function backup() {
  fs.copyFileSync("tasks.md", "tasks.md.bak");
}

if (firstArg === "add") {
  backup();
  const task = args.slice(1).join(" ")
  fs.appendFileSync("tasks.md", `- [ ] ${task}\n`)
  console.log("La til oppgave", task);
}
else if (firstArg === "list") {
  console.log("Alle oppgaver:\n");
  console.log(fs.readFileSync("tasks.md", "utf8"))
} else if (firstArg === "done" && !isNaN(args[1])) {
  backup();
  console.log(`Marker oppgave ${args[1]} som ferdig`)
  let file = fs.readFileSync("tasks.md", "utf8").split("\n");
  let editedFile = [];
  file.forEach((task, index) => {
    if (Number(args[1]) === index + 1) {
      const changeIndex = task.indexOf("]")
      task = `- [x] ${task.slice(changeIndex + 2)}`
    }
    editedFile.push(task);
  });
  fs.writeFileSync("tasks.md", editedFile.join("\n"))
} else {
  console.log("Ugyldig kommando")
}
```

## «Edge-cases», valideringer, refaktorering og andre endringer

Med kunnskapen tilegnet meg over, jobbet jeg videre med koden for å implementere valideringer av argumenter, refaktorering av kode, bytte til 'switch', nummerering av oppgaver, muligheten for å endre en oppgave fra gjort til uferdig, sletting av en oppgave og generell robusthet og kodekvalitet:

### Valideringer jeg implementerte:
- Er argumentet et tall?
- Er nummeret innenfor gyldig område?
- Er oppgaven allerede markert som ferdig/uferdig?
- Håndtering av tomme filer

### Refaktoreringer:
- Byttet fra if-else-kjede til `switch` for bedre lesbarhet
- Ekstraherte `checkTask()` som unified funksjon for check/uncheck
- Separate valideringsfunksjoner for fil og oppgaver

### Komplett kode ved dette steget:

```js
"use strict"

const fs = require("fs");
const args = process.argv.slice(2);
const firstArg = args[0];
const secondArg = args[1];
const tasksFileName = "tasks.md";
const completedFileName = "completed.md";
let fileContentTasks;
let fileContentCompleted;


// Check for valid argument
function checkForValidArgument() {
  if (secondArg && secondArg.trim().length > 0) {
    return true;
  } else {
    console.log("Må angi et argument")
    return false;
  }
}

// Validate file
function validateFile(...files) {
  files.forEach((file) => {
    // create file if it doesnt exist
    if (!fs.existsSync(`./${file}`)) {fs.writeFileSync(file, "")};
    const readFile = fs.readFileSync(file, "utf8").trim("").split("\n");
    
    // avoid empty line on top of document
    if(readFile.length === 1 && readFile[0] == "") {readFile.length = 0};
    
    switch(file) {
      case tasksFileName:
        fileContentTasks = readFile;
        break;
      case completedFileName:
        fileContentCompleted = readFile;
        break;
    }
  });
}

// Validate tasks
function checkForValidTask(status) {
  if (isNaN(secondArg) || !Number.isInteger(Number(secondArg)) || secondArg.trim().length == 0) {
    console.log("Må være et nummer uten desimaler")
    return false;
  } 
  if (args.length > 2) {
    console.log("Angi kun ett tall uten mellomrom");
    return false;
  }
  if (!(status ? fileContentTasks.length : fileContentCompleted.length)) {
    console.log(`Ingen ${status ? "" : "fullførte "}oppgaver i listen`); 
    return false
  }
  if (status) {
    if (secondArg < 1 || secondArg > fileContentTasks.length) {
      console.log("Nummer utenfor rekkevidde.")
      return false;
    } 
  } else if (!status) {
      if (secondArg < fileContentTasks.length + 1 || secondArg > fileContentCompleted.length + fileContentTasks.length) {
        console.log("Nummer utenfor rekkevidde.")
        return false;
      }
  }
  return true;
}

// write files
function writeFiles() {
  fs.writeFileSync(tasksFileName, fileContentTasks.join("\n") + "\n");
  fs.writeFileSync(completedFileName, fileContentCompleted.join("\n") + "\n");
}

// create a backup
function backup(...files) {
  files.forEach((file) => fs.copyFileSync(file, `${file}.bak`));
}

// list tasks
function listTasks() {
  const readFileTasks = fs.readFileSync(tasksFileName, "utf8").trim("").split("\n");
  const readFileCompleted = fs.readFileSync(completedFileName, "utf8").trim("").split("\n");
  
  console.log("Oppgaver som venter:")
  readFileTasks.forEach((task, index) => {
    if(task == "") {
      console.log("0")
    } else {
      console.log(`${index + 1}. [ ] ${task}`);
  }
  });
  console.log("\nFullførte oppgaver:")
  readFileCompleted.forEach((task, index) => {
    if (task == "") {
      console.log("0");
    } else {
      console.log(`${index + (readFileTasks[0] == "" ? readFileTasks.length : readFileTasks.length + 1)}. [x] ${task}`);
    }
  });

}

// move task to opposite file
function moveTask(status) {
  backup(tasksFileName, completedFileName);
  let editedFile = [];

  (status ? fileContentTasks : fileContentCompleted).forEach((task, index) => {
    if ((status ? secondArg : (secondArg - fileContentTasks.length)) != index + 1) {
      editedFile.push(task);
    } else {
      (status ? fileContentCompleted : fileContentTasks).push(task);
    }
  }); 
  (status ? fileContentTasks = editedFile : fileContentCompleted = editedFile);
  console.log(`Marker oppgave ${secondArg} som ${status ? "ferdig" : "uferdig"}`);
  writeFiles();
  }

// delete a task
function deleteTask() {
  backup(tasksFileName, completedFileName);
  let newArray = [];
  if (isNaN(secondArg) || !Number.isInteger(Number(secondArg)) || secondArg.trim().length == 0 || args.length > 2) { 
    console.log("Angi et gyldig tall uten desimaler og mellomrom")
    return false;
  } else if (Number(secondArg) > 0 && Number(secondArg) <= fileContentTasks.length) {
    // Her er det selvsagt bedre med filter, enn å kutte to ganger
    newArray.push(...(fileContentTasks.slice(0, secondArg - 1)));
    newArray.push(...(fileContentTasks.slice(secondArg)));
    fileContentTasks = newArray;
    writeFiles();
    console.log(`Sletter oppgave ${secondArg}`)
    return true;
  } else if (Number(secondArg) <=  fileContentTasks.length + fileContentCompleted.length) {
    // Her er det selvsagt bedre med filter, enn å kutte to ganger
    newArray.push(...(fileContentCompleted.slice(0, (secondArg - fileContentTasks.length - 1))));
    newArray.push(...(fileContentCompleted.slice((secondArg - fileContentTasks.length))));
    fileContentCompleted = newArray;
    writeFiles();
    console.log(`Sletter oppgave ${secondArg}`)
    return true;
  } else {
    console.log("Nummer utenfor rekkevidde");
    return false;
  }
}

switch(firstArg) {
  case "add":
    if ( !checkForValidArgument() ) { return };
    validateFile(tasksFileName);
    backup(tasksFileName);
    const task = args.slice(1).join(" ");
    fs.appendFileSync(tasksFileName, `${task}\n`)
    console.log("La til oppgave", task);
    break;
  case "check":
    validateFile(tasksFileName, completedFileName)
    if ( !checkForValidTask(true) ) { return };
    moveTask(true);
    break;
  case "uncheck":
    validateFile(tasksFileName, completedFileName)
    if ( !checkForValidTask(false) ) { return };
    moveTask(false);
    break;
  case "del":
    validateFile(tasksFileName, completedFileName)
    deleteTask();
    break;
  case "list":
    validateFile(tasksFileName, completedFileName)
    listTasks();
    break;
  default:
    console.log("Ugyldig kommando");
};
```

Det ble en enkel Node-applikasjon, som blant annet lærte meg:

### Node-spesifikke konsepter:
- `fs`-modulen: readFileSync, writeFileSync, appendFileSync, copyFileSync
- Filer returnerer buffer (binærdata) - må spesifisere `utf8`
- `process.argv` for kommandolinje-argumenter
- Filer leses som én lang streng, ikke linje-for-linje

### Generelle erkjennelser:
- Filoperasjoner krever: les alt -> endre -> skriv alt tilbake
- Backup før destruktive operasjoner er essensielt
- Switch vs if-else: bedre struktur og lesbarhet i større kommandohåndtering.
- «Edge cases» må planlegges nøye og testes (tomme filer, ugyldige nummer, osv.)
