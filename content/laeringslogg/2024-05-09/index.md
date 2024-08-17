---
date: 2024-05-09
title: 2024-05-09
laeringsemner: [css]
---

### CSS 
* Jeg fant ut at man kan benytte negative verdier i CSS-variabler. Jeg benyttet dette i footer for å få den til å strekke seg ut til begge sider av nettleseren ved å konvertere til negative verdier.
```css
footer {
    margin: var(--max) calc(clamp(var(--medium_2), 8vw, var(--large_2)) * -1) calc(clamp(var(--medium_2), 8vw, var(--large_2)) * -1) calc(clamp(var(--medium_2), 8vw, var(--large_2)) * -1)
}
```
