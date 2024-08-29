---
date: 2024-05-05
title: 2024-05-05
laeringsemner: [hugo]
---

## Hugo
* Med «page bundles» i HUGO kan man liste opp alle sider og tilhørende ressurser i en «bundle» eller seksjon. Med følgende oppsett...
```html
├───blogg
│   ├───blogg-1
│   │       img-1.jpg
│   │       index.md
│   │
│   ├───blogg-2
│   │       img-1.jpg
│   │       img-2.jpg
│   │       index.md
│   │
│   └───blogg-3
│           img-1.jpg
│           img-2.jpg
│           img-3.jpg
│           index.md
```
* ... kan vi hente frem alt i «blogg-seksjonen» på følgende måte:
```html
{{range where .Pages "Section" "blogg" }}
  {{ .Title }}
  {{ with .Resources.ByType "image" }}
    {{ range . }}
      {{ .Title }}
    {{ end }}
  {{ end }}
{{ end }}
```
* Det vil gi oss dette resultatet:
```text
Post 3
    img-1.jpg
    img-2.jpg
    img-3.jpg
Post 2
    img-1.jpg
    img-2.jpg
Post 1
    img-1.jpg
```
