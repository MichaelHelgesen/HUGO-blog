---
title: 2026-01-15
date: 2026-01-15
laeringsemner: [hugo]
---
## hugo

- I dag fant jeg ut hvordan jeg kan samle tekster under en serie i Hugo.
    - Først etablere ønsket «taxonomy» i konfigurasjonen `hugo.toml`:

```toml
[taxonomies]
  tekstemne = "tekstemner"
  laeringsemne = "laeringsemner"
  serie = "serier"
```

- Deretter opprette design i `/layoyt/serier` for både landingssiden /serier (`taxonomy.hmtl`) og detaljsiden /serier/[SERIENAVN] (`term.html`).
- Innholdet på landingssiden for serier, samt andre detaljer for siden etableres under `/content/serier/_index.html`

```md
---
title: Serier
url: /serier
aliases:
    - serier
---

<h1>Liste over blogg-serier</h1>
<p class="ingress">
    Under følger en liste over tekster som er samlet under en felles serie.
</p>

```

- Til slutt la jeg til en funksjon på `/layouts/_default/single` som sjekker om teksten er en del av en serie. Hvis så er tilfelle, vises en liste over de øvrige tekstene i samme serie som lenker:

```html
<!-- ... -->
{{ if .Param "serier" }} 
    {{ $currentPage := .Page.Permalink }} 
    {{ $name := index.Params.serier 0 }}

    <div class="serie">
	    <p> Denne teksten inngår i serien <a href="/serier/{{$name | urlize }}">{{$name}}</a>.</p>

        <p style="margin-bottom: 0;">Andre artikler i samme serie:</p>

        {{ $name := $name | urlize }} 
        {{ $series := index .Site.Taxonomies.serier $name }}
        <ul class="series" style="margin-top: .5rem;">
        {{ range $series.Pages }}
            <li>
                {{ if ne $currentPage .Permalink }}
                    <a href="{{.Permalink}}">{{.LinkTitle}}</a>
                {{ else }}
                    <b>{{.LinkTitle}}</b>{{ end }}
            </li>
                {{end}}
        </ul>
    </div>
{{end}}
<!-- ... -->
```

- Hvis jeg i `.md`-filene skriver `serier: ["homelab"]`, vil "homelab" bli en egen serie (/serier/homelab), med alle tilhørende tekster under seg.
