---
title: 2025-01-28
date: 2025-01-28
laeringsemner: [sanity]
---
## sanity
- Fullførte kurset [Handling schema changes confidently](https://www.sanity.io/learn/course/handling-schema-changes-confidently/introduction-to-schema-change-management) og lærte om endringer av skjema, migrering av data, eksport og import av data.
- Vi kan laste opp hele datasett `npx sanity@latest dataset import ~/path/to/production.tar.gz production`.
- Kan validere med `npx sanity@latest documents validate`.
- For å endre navn på et felt kan man gå frem på følgende måte:
    - Legge til nytt felt med nytt navn.
    - Deaktivere gammelt felt `deprecated: { reason: "Use the event Format field insteda."}`
    - Oppdatere spørringen for å hente fra den nye feltet, med mulighet til å falle tilbake på gammelt felt.
    - Oppdatere GROQ-spørring i front-end filer til å støtte begge felt ved bruk av «coalesce»: ` "eventType": coalesce(format, eventType)`.
        - Koden over betyr at man skal bruke `format`, om den har verdi, og knytte den til `eventType`. Om `format` er tom, skal `eventType` brukes.
    - Lag et migrasjonsscript for å forberede flytting av data fra gammelt felt til nytt: `npx sanity@latest migration create "Replace event type with event format"`.
    - I scriptet sett `to` og `from` til korrekte feltnavn.
    - Kjør `npx sanity@latest migration list`for å vise migrasjonslister.
    - Kjør en «dry run» for å se hvordan en migrasjon vil påvirke studio: `npx sanity@latest migration run replace-event-type-with-event-format`.
    - Eksporter gammel database: `npx sanity@latest dataset export production`.
    - Ønsker du å tilbakestille til et stadie før migreringen, bruk: `npx sanity@latest dataset import production.tar.gz production --replace`.
	- Kjør migrering med `npx sanity@latest migration run replace-event-type-with-event-format --no-dry-run`.
	- Kjør validate på nytt for å se etter 0 errors: `npx sanity@latest documents validate -y`
	- Fjern støtten for gammelt felt.
		- Slett fra GROQ i front-end: `"eventType": coalesce(format, eventType)`
		- Endre i front-end. I dette tilfellet fra `eventType` til `format`
- Man kan også bruke en tilnærming Sanity kaller «indempotent».
    - Betyr at man skal kunne kjøre migrasjonen flere ganger med samme resultat.
    - Hindre at migrering skaper uønskede endringer.
        - Kan bruke filter i scriptet for å velge kun de dokumentene som skal migreres.
        - Ikke alltid filter kan brukes, da kan vi legge til en nøkkel når vi migrerer og hoppe over dokumenter som allerede har nøkler.
- Filter:
```ts
import {defineMigration, at, setIfMissing, unset} from 'sanity/migrate'

const from = 'eventType'
const to = 'format'

export default defineMigration({
  title: 'Replace event type with event format',
  // documentTypes: ['event'],
  filter: '_type == "event" && defined(eventType) && !defined(format)',
  migrate: {
    document(doc, context) {
      return [at(to, setIfMissing(doc[from])), at(from, unset())]
    },
  },
})
```
- idempotenceKey (nøkkel):
```ts
import {defineMigration, at, setIfMissing, unset, insert} from 'sanity/migrate'

// should be unique for the migration but never change
const idempotenceKey = 'xyz' 

const from = 'eventType'
const to = 'format'

export default defineMigration({
  title: 'Replace event type with event format',
  // documentTypes: ['event'],
  filter: '_type == "event" && defined(eventType) && !defined(format)',
  migrate: {
    document(doc, context) {
      if ((doc?._migrations as string[] || []).includes(idempotenceKey)) {
        // Document already migrated, so we can skip
        return
      }
      return [
        at(to, setIfMissing(doc[from])),
        at(from, unset()),
        //… add idempotence key
        at('_migrations', setIfMissing([])),
        at('_migrations', insert(idempotenceKey, 'after', 0)),
      ]
    },
  },
})
```
