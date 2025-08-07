---
title: 2025-08-07
date: 2025-08-07
laeringsemner: [css, devtools]
---
## css
- Funksjonen `:where()` i CSS har jeg ingen tidligere erfaring med. 
- Det er en funksjon som tar en selektor-liste som argument. Funksjonen velger da alle elementer som kan nås via en av selektorene i den angitte listen.
```css
:where(header, main, footer) {
    margin: 0;
    padding: 0;
}
```
- `:where()` gir 0,0,0 i spesifisitet til selektorene, og er dermed lett å overstyre senere uten å måtte ha en enda mer nøyaktig spesifisering, som kan gjøre det vanskelig å holde kontroll på stilarket.
```css
.btn {
    color: green;
}

/* Krever mer spesifikke selektorer for å overstyre */
button.btn {
    color: green;
}
```
```css
:where(.btn) {
    color: green;
}

/* Kan overstyre med vanlig spesifisitet */
.btn {
    color: red;
}
```
- Kjekt å bruke for basisstiler som «reset», «layout» og tema, samt til «utility-klasser».

## devtools
- Fikk følgende advarsel i Googles Lighthouse: 
```text
Found an <h1> tag within an <article>, <aside>, <nav>, or <section> which does not have a specified font-size. 
The size of this heading text will be changing in this browser in the near future.
```
- Henviste til [MND](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements#specifying_a_uniform_font_size_for_h1) for forklaring.
- Gikk ut på at `h1` ikke hadde en grunnleggende størrelse, slik at den kan komme til å variere ut i fra hvilket element den er plassert i.
