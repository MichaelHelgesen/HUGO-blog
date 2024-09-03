---
title: Opprette sider i Hugo via API
date: 2024-04-19
tekstemner: [hugo, api, zotero, programmering]
ingress: "Det er i utgangspunktet ikke mulig å opprette sider i Hugo via et API, men det finnes måter å komme rundt problemet."
listeintro: Et alternativ for å løse et av Hugos største begrensninger.
merknad: "I oppdatering 0.126.0 av HUGO ble det endelig mulig å opprette sider dynamisk under bygging! Det kalles «content adapters». Dermed er ikke denne teksten like relevant lenger. [Les mer om «content adapters» her](https://gohugo.io/content-management/content-adapters/)" 
merknad_dato: 2024-05-21
Description: En alternativ fremgangsmåte for å opprette sider i HUGO via et API.
---
Under opprettelsen av denne bloggen hadde jeg et ønske om å koble til [Zotero](https://zotero.org), slik at alle kilder jeg har benyttet og henviser til i tekster automatisk konverteres til sider i Hugo.

Etter litt søking forsto jeg at det å opprette sider basert på en ekstern kilde under byggingen av et Hugo-nettsted lenge har blitt sett på som et av Hugos største begrensninger. Operasjonen har alltid krevd en to-stegs prosess.

Årsaken til dette er at Hugo baserer seg på «markdown»-filer, og disse filene må være tilgjengelig i det man kjører `hugo`-kommandoen. Dermed har man delt denne prosessen i to, ved at man først henter ekstern data og lager «markdown»-filer via et skript. Deretter har man kjørt bygge-kommandoen med filene generert i steg en.

Det fungerer fint, men basert på en [artikkel](https://www.thenewdynamic.com/article/toward-using-a-headless-cms-with-hugo-part-2-building-from-remote-api/) jeg fant er det mulig å gjøre alt dette i Hugo, i en og samme operasjon, selv om det fortsatt i praksis er to steg.

## Hugo i Hugo
Denne fremgangsmåten benytter to Hugo-instanser. Vi har hovedprosjektet, som benyttes til å generere nettsiden, samt en versjon som kun benyttes til å hente ekstern data og generere «markdown»-filer. 

For ordens skyld oppretter vi sistnevnte som en mappe i hovedprosjektet vårt `/prebuild`.
I denne mappen oppretter vi 

* `config.yaml`: for innstillinger, og muligheten for å kjøre `hugo`-kommandoen
* `/layouts/index.html` for API-tilkoblingen og «markdown»-generering

### Hente ekstern data
I `layouts/index.html` starter vi med å koble til det eksterne API-et:

```go
{{ with resources.GetRemote "https://api.zotero.org/groups/5454933/collections/U68Q8VUJ/items/top?format=json"}}
{{ end }}
```

Her benyttes `resources.GetRemote` som er [Hugos funksjon for å hente data](https://gohugo.io/functions/resources/getremote/). Vi legger `with` foran, som binder konteksten til API-kallet. Det vil si at koden i blokken kjøres så fremt API-kallet mottar data.

> (with) Binds context (the dot) to the expression and executes the block if expression is truthy.  
> *[Hugo](https://gohugo.io/functions/go-template/with/)*

Hvis kallet er vellykket, må vi utføre en del handlinger med dataene vi mottar.

### Opprette «markdown»-filer
Hugo har en rekke funksjoner som kan hjelpe oss i prosessen med å opprette filer. Den komplette koden er som følger: 

```go
{{ with resources.GetRemote "https://api.zotero.org/groups/5454933/collections/U68Q8VUJ/items/top?format=json"}}
    {{ with .Content }} 
        {{ with transform.Unmarshal . }}
            {{ range . }}
                {{ $string := jsonify . }} 
                {{ $filename := printf "sources/%s.md" (urlize .data.title) }} 
                {{ $resource := resources.FromString $filename $string }} 
                {{ $file := $resource.RelPermalink }} 
            {{ end }}
        {{ end }}
    {{ end }}
{{ end }}
```

1. `{{ with .Content }}`: Vi angir innholdet i API-kallet som kontekst.
2. `{{ with transform.Unmarshal . }}`: En funksjon som endrer JSON-strengen fra API-kallet til et objekt som Hugo forstår, og som lar oss benytte andre Hugo funksjoner og metoder på dataene. Vi angir også dette objektet som kontekst med `with`.
3. `{{ range . }}`: En loop som, i dette tilfellet, lar oss utføre handlinger på alle kilder i listen vi har hentet via API-kallet.
4. `{{ $string := jsonify .}}`: Generere JSON-streng av kilden.
5. `{{ $filename := printf "kilder/%s.md" (urlize .data.title) }}`: Vi oppretter et filnavn til den kommende «markdown»-filen.   
6. `{{ $resource := resources.FromString $filename $string }}`: Denne funksjonen genererer «markdown»-ressursen basert på variablene vi opprettet over.
7. `{{ $file := $resource.RelPermalink }}`: Funksjonen som faktisk publiserer ressursen vi oppretter over. 

Koden kan også kortes ned på følgende måte:

```go
{{ with resources.GetRemote "https://api.zotero.org/groups/5454933/collections/U68Q8VUJ/items/top?format=json"}}
    {{ $sources := unmarshal .Content }}
        {{ range $sources }}
            {{ $string := jsonify . }} 
            {{ $filename := printf "sources/%s.md" (urlize .data.title) }} 
            {{ $resource := resources.FromString $filename $string }} 
            {{ $file := $resource.RelPermalink }} 
        {{ end }}
    {{ end }}
{{ end }}
```

#### JSON som «frontmatter»
En ting som er viktig å forstå i prosessen over, er at «markdown»-filene vi oppretter inneholder en JSON-streng med data fra API-et (steg 4 og 6). 

Denne JSON-strengen blir tolket som «frontmatter» av Hugo. Det vurderes altså som metadata, og vil ikke vises via `{{ .Content }}`-metoden. 

Og i dette tilfellet er JSON-strengen stor og vanskelig å lese, men det er ikke så farlig så lenge det kun er Hugo, og ikke mennesker som skal tyde den, men det er mulig å lage den mer oversiktlig ved behov.

Slik ser JSON-frontmatter ut i dette tilfellet: 
```json
{"data":{"ISBN":"9780671212094 9781476790152","abstractNote":"","accessDate":"","archive":"","archiveLocation":"","callNumber":"","collections":["U68Q8VUJ"],"creators":[{"creatorType":"author","firstName":"Mortimer Jerome","lastName":"Adler"},{"creatorType":"author","firstName":"Charles Lincoln","lastName":"Van Doren"}],"date":"2014","dateAdded":"2024-03-19T17:12:51Z","dateModified":"2024-03-19T17:12:51Z","edition":"Touchstone edition","extra":"","itemType":"book","key":"KDJ8DIH4","language":"eng","libraryCatalog":"K10plus ISBN","numPages":"424","numberOfVolumes":"","place":"New York","publisher":"Touchstone","relations":{},"rights":"","series":"","seriesNumber":"","shortTitle":"","tags":[],"title":"How to read a book","url":"","version":11,"volume":""},"key":"KDJ8DIH4","library":{"id":5454933,"links":{"alternate":{"href":"https://www.zotero.org/groups/mikkesblogg","type":"text/html"}},"name":"mikkesblogg","type":"group"},"links":{"alternate":{"href":"https://www.zotero.org/groups/mikkesblogg/items/KDJ8DIH4","type":"text/html"},"self":{"href":"https://api.zotero.org/groups/5454933/items/KDJ8DIH4","type":"application/json"}},"meta":{"createdByUser":{"id":9890568,"links":{"alternate":{"href":"https://www.zotero.org/mikke02","type":"text/html"}},"name":"","username":"Mikke02"},"creatorSummary":"Adler and Van Doren","numChildren":1,"parsedDate":"2014"},"version":11}
```
### Forenkle bygge-kommandoen
Før vi kjører `hugo`-kommandoen og oppretter filene er det en fordel å forenkle oppsettet, slik at vi skaper en så minimalistisk og kjapp byggeprosess som mulig. Denne Hugo-instansen skal tross alt kun benyttes til å skape «markdown»-filer. 

I `prebuild/config.yaml` anbefales det å angi følgende: 

```yaml
disableKinds:
- sitemap
- taxonomy
- term
outputs:
  home:
  - html
```

Da er alt klart, og vi kan kjøre `hugo`-kommandoen fra `/prebuild`-mappen.

I mappen `prebuild/public/kilder` ligger så alle bøkene hentet fra Zotero via API-et.

## Inkludere nyopprettede filer i hovedprosjektet
Hovedinstallasjonen av Hugo skjønner ikke at det ligger «markdown»-filer i `/prebuild/public/kilder`, så vi må angi dette i `config.yaml`:

```yaml
module:
  mounts:
  - source: content
    target: content
  - source: prebuild/public/kilder
    target: content/kilder
```

### Oppdatere maler
Som nevnt i avsnittet JSON som «frontmatter» ligger all data fra API-kallet som metadata i de nyopprettede «markdown»-filene.

Det vil si at vi må bruke `Params` som nøkkel i malene, som her i `/layouts/kilder/index.html`:

```go
{{ define "main" }}
{{ .Content }}    
<ul>
    {{ range .Pages}}
    <li>
        <a href="{{ .Page.Permalink }}"><h2 id={{.Title}}>{{ .Params.data.title }}</h2></a>
        {{ range .Params.data.creators }}
            {{ .firstName }} {{ .lastName }} 
        {{ end}}
    </li>
    {{ end }}
</ul>
{{ end }}
```

### Slå sammen prosessen til en kommando
For at dette skal virke må vi først kjøre `hugo`-kommandoen fra `/prebuild`-mappen, og deretter fra hovedprosjektet. Dette kan vi slå sammen på følgende måte:

```text
hugo -s prebuild && hugo
```

`-s` er en forkortelse for `--source` og angir hva som skal bygges først.

Det er det hele. Nå kan du lage Hugo-sider med masse spennende innhold fra eksterne API-er.
