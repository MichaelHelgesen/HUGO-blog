---
title: 2025-08-11
date: 2025-08-11
laeringsemner: [nextjs]
---
## nextjs
- For å benytte miljøvariabler fra `.env`-fil i NextJS, må vi skille mellom hva som skal være tilgjengelig i nettleser og på server.
- Det som kun skal være tilgjengelig på server kan benytte `process.env.VAR-NAVN`.
- Det som skal være tilgjengelig i nettleseren må bruke `process.env.NEXT_PUBLIC_VAR_NAVN`. `NEXT_PUBLIC_` må altså være starten av variabel-navnet.
