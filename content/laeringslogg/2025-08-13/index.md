---
title: 2025-08-13
date: 2025-08-13
laeringsemner: [nextjs, sanity]
---
## nextjs
- Lært om oppbygning av applikasjon i Next.js:
```text
/my-next-app
├── public/
├── src/
│   ├── app/              
│   │   ├── page.tsx     
│   │   ├── layout.tsx  
│   │   ├── kontakt/
│   │   │   └── page.ts
│   │   ├── [slug]/   
│   │   │   └── page.tsx
│   │   └── globale.cs
│   │
│   ├── components/  
│   │   ├── Header.tsx
│   │   ├── Footer.tsx
│   │   └── PortableText.tsx
│   │
│   ├── lib/        
│   │   ├── sanity.t
│   │   └── utils.t
│   │
│   ├── types/    
│   │   └── page.t
│   │
│   ├── styles/  
│   │   └── globals.css
│   │
│   └── hooks/  
│       └── useWindowSize.ts
│
├── .env.local 
├── next.config.j
├── tsconfig.jso
└── package.json
```
- **public**: Statisk innhold som bilder, favicon, PDF-er og så videre. Kopieres til rot ved bygging.
- **src**: Organisatorisk mappe. Anbefales for orden.
    - **app**: Next.js-ruter (App router).
        - **page.tsx**: Forsiden.
        - **layout.tsx**: Grunnleggende layout, som `<htm>, <head>, <body>`.
        - **kontakt**: Eksempel på statisk underside.
            - **page.tsx**: Innhold på statisk side `/kontakt`.
        - **[slug]**: Dynamiske sider, for eksempel innhold fra CMS.
            - **page.tsx**: Innhold på dynamiske sider.
        - **global.css**: Felles CSS/typografi. Kan benyttes for små prosjekter. For større applikasjoner, hvor CSS bør deles opp, brukes heller `/styles/globals.css` og flere.
    - **components**: Gjenbrukbare React-komponenter.
        - **Header.tsx**: Eksempel på React-komponent.
    - **lib**: Funksjoner, API-kall, konfigurasjoner.
        - **sanity.ts**: Eksempel.
    - **types**: Typescript-typer.
        - **page.ts**: Eksempel.
    - **styles**: CSS-moduler eller globale stilark. Brukes gjerne for større prosjekter.
        - **globals.css**: Eksempel.
    - **hooks**: Egne React-hooks.
        - **useWindowSize.ts**: Eksempel.
- **.env.local**: Miljøvariabler.
- **next.config.js**: Konfigurasjon av Next.js.
- **tsconfig.json**: Typescript-innstillinger.
- **package.json**
- **med mer**  
\--\-  
- `.env.local` i Next.js:
    - Filen må ligge på rot.
    - Variabler som skal være tilgjengelig i Frontend på inkludere prefikset `NEXT_PUBLIC_`. Eksempel `NEXT_PUBLIC_API_URL`.
    - Variabler for backend trenger ikke spesielle prefiks.
    - Brukes på følgende måte i koden: `process.env.NEXT_PUBLIC_API_URL`.

## sanity
- `.env.local` i Sanity:
    - Variabler som har prefikset `SANITY_STUDIO_` blir automatisk inkludert i Sanity CLI-verktøy, utviklingsserveren og «bundler».
    - Brukes på følgende måte: `process.env.SANITY_STUDIO_`...
