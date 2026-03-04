---
title: Dotfiles til Git
date: 2026-02-06
tekstemner: [hjemmeserver]
serier: [hjemmeserver]
listeintro: "Slik installerte jeg Proxmox og opprettet min første virtuelle Ubuntu-maskin på Mac Pro 2013-modell"
Description: "Slik installerer man Proxmox på en Mac Pro 2013."
ingress: "Under planleggingen av serveroppsett konkluderte jeg med at Proxmox ville passe perfekt. Den lar meg kjøre flere Linux-distribusjoner på én maskin, for maksimal læring og testing. Men veien dit var ikke uten utfordringer."
---

Etter at jeg installerte Proxmox og en virtuell maskin (VM) med Ubuntu, undersøkte jeg fremgangsmåten for å dele programmer, installasjoner, dokumentasjon og oppsett mellom serveren, VM-er, og flere av mine laptoper. 

re er scriptet som kjøres, og resten er argumenter fra terminalen.
Svaret var «dotfiles». Det er konfigurasjonsfiler som typisk starter med punktum (.bashrc, .vimrc, etc.), og er plassert i hjem-katalogen (`/users/USER`). Dotfiles er nemlig personlige filer som er ment å følge brukeren. 

## Git
Det anbefales å lagre «dotfiles» som Git-repositories, for trygg lagring og enkel versjonskontroll og tilgang. Så jeg startet der. Jeg opprettet:

- [Dotfiles](https://github.com/MichaelHelgesen/dotfiles)
- [Homelab](https://github.com/MichaelHelgesen/homelab) 

Jeg definerte repoene som «public», og kunne derfor enkelt klone dem på min bærbare maskin med en kommando som følgende: 

```bash
git clone https://github.com/MichaelHelgesen/dotfiles.git
```

Men hvorfor to separate «repos»?

## To «repositories»
Jeg tenkte at det var en god ide å separere dem, slik at de ikke blir så omfattende. Dessuten er «dotfiles» ment å være et personlig oppsett som skal følge meg rundt på flere installasjoner, mens «homelab» kun skal brukes på serveren, og inneholder infrastruktur, oppsett, og programmer spesifikk for servermiljøet. Men jeg skal klone begge to flere steder, for oppdateringer og utvidelser. 

Slik jeg forsto det, er det standard praksis å ha en «README» på root som gir oversikt over repoet, og deretter egne mapper for spesifikke program, dokumenter, skripter og så videre, også med sine respektive «README»-filer.

Eksempel på «dotfiles»-struktur:

```text
dotfiles/
├── README.md
├── dokumenter/
│   └── plan.md          
├── nvim/
│   └── README.md
├── bash/
│   ├── .bashrc
│   └── README.md
└── scripts/
    └── 01-base-packages.sh          
  
```

Eksempel på «homelab»-repo:

```text
homelab/
├── README.md                         
├── dokumenter/
│   └── arkitektur.md              
├── tjenester/
│   ├── jellyfin/
│   │   ├── README.md                
│   │   └── docker-compose.yml       
│   ├── navidrome/
│   ├── immich/
│   └── nextcloud/
├── nettverk/
│   ├── wireguard/
│   └── nginx-proxy-manager/
└── scripts/
    └── setup-vm.sh 
```

## Mål og mening
Jeg lærte at det er viktig å holde disse filene oppdatert, men jeg antar at man også må finne en passende balanse mellom graden av detaljer og tiden man ønsker å bruke. 

Det positive:
- Tvinger meg til å tenke gjennom hva jeg gjør og hvorfor
- Fremtidige meg vil være takknemlig
- Jeg lærer bedre når jeg dokumenterer
- «README»-filer er gode råmaterialer for bloggposter
- Oppsett av nye maskiner går raskt

Det utfordrende:
- Tar tid
- Lett å glemme
- Kan føles som overhengende rutinearbeid

Hvordan jeg går frem for å vedlikeholde dette, og hvor mye jeg skal legge i det må rett og slett gå seg til basert på erfaring. Det som bør dokumenteres er vel oppsett, konfigurasjonsvalg og feilsøking kanskje, mens det kan være greit å sløyfe hver enkelt filendring, rutine-oppdateringer og unødvendige beskrivelser. 

Jeg velger i alle fall å bygge stein for stein, og starter derfor helt enkelt med følgende:

Repository 1: `dotfiles`

```text
dotfiles/
├── README.md
└── dokumenter/
    └── plan.md
```

Repository 2: `homelab` 

```text 
homelab/ 
├── README.md 
└── dokumenter/ 
	├── plan.md 
	└── arkitektur.md
```

## Utvidelse med `.bashrc`

Utgangspunktet for «dotfiler» var å ha samme oppsett på flere Linux-installasjoner, derfor utvidet jeg «dotfile»-repoet ganske snart med en `.bashrc`-fil for personlige aliaser og konfigurasjoner til bruk i Bash:

```bash
#Mikkes .bashrc
# Personlige aliaser og konfigurasjon

# ============================================
# ALIASER - Navigasjon
# ============================================
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../"
alias ~="cd ~"

#ls-varianter
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"

# ============================================
# ALIASER - Git
# ============================================
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'

# ============================================
# BASH COMPLETION
# ============================================
# Smart tab-completion for kommandoer
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Case-insensitive tab-completion
bind 'set completion-ignore-case on'

# ============================================
# ANDRE FORBEDRINGER
# ============================================
# Fargede ls-output (hvis det støttes)
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# ============================================
# PROMPT
# ============================================
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[33m\]$(parse_git_branch)\[\033[00m\]\$ '

# ============================================
# HISTORIKK
# ============================================
# Historikk
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth
shopt -s histappend
```

Jeg la også til en `README.md`, men den synes jeg repeterte for mye fra `.bashrc`, så den tenker jeg senere å minimere.

Til slutt lastet jeg den nye versjonen av `dotfiles` til Github.

### Installasjon

For å bruke min personlige `.bashrc`-fil på andre maskiner måtte jeg først klone «repoet» som nevnt tidligere, eller laste ned siste versjon med `git pull`.

`.bashrc` ligger som regel i hjem-mappen som standard i de fleste Linux-installasjoner. For å erstatte den med min nye versjon, måtte jeg opprette en symlink mellom `/dotfiles` og eksisterende `.bashrc`.

```bash
ln -sf ~/dotfiles/bash/.bashrc ~/.bashrc

# ln <kilde> <mål>: Kommandoen for å opprette en link til eksisterende file eller katalog.
# -s: Flagg for å opprette symbolsk lenke, og ikke hard link.
# -f: Flagg for å tvinge opprettelsen, dersom fil finnes fra før.
```

Siden symlink-kommandoen erstatter den eksisterende, tok jeg først en backup. 

```bash
cp ~/.bashrc ~/.bashrc.backup
```

Jeg undersøkte også hva som var i den eksisterende, og om det var dumt å overskrive. 

Alternativene var:
1. Bygge egen fra bunn, og minste det som var som standard
2. Slå sammen min og eksisterende
3. Source først, så inkludere eget. 

Jeg gikk for nummer 1, slik at jeg lærer mest mulig, og bygger etter behov.

For å aktivere ny versjon av `.bashrc` i Linux, må man skrive kommandoen `source ~/.bashrc`.

### Installasjonskript

Jeg ønsket selvsagt også samme Bash-oppsett på Proxmox, men der var ikke Git installert, så det måtte jeg gjøre først.

Det inspirerte meg til å opprette mitt første installasjons-skript i «dotfilen». Jeg laget mappen `scripts`, og la inn filen `01-base-packages.sh` og `README.md`.

I Bash-filen la jeg inn følgende:

```bash
#!/bin/bash
# 01-base-packages.sh
# Installer grunnleggende pakker som trengs på alle maskiner

set -e  # Stopp ved feil

echo "=== Installerer grunnleggende pakker ==="

# Sjekk om man kjører som root/sudo
if [ "$EUID" -ne 0 ]; then 
    echo "Dette scriptet må kjøres med sudo"
    echo "Kjør: sudo ./01-base-packages.sh"
    exit 1
fi

# Oppdater system
echo "Oppdaterer pakkelister..."
apt update

# Grunnleggende verktøy
echo "Installerer grunnpakker..."
apt install -y \
    git \
    curl \
    wget \
    htop \
    tree \
    unzip \
    vim

echo ""
echo "Grunnpakker installert"
echo ""
echo "Installerte pakker:"
echo "  - git: Versjonskontroll"
echo "  - curl/wget: Last ned filer"
echo "  - htop: Prosess-monitor"
echo "  - tree: Vis mappestruktur"
echo "  - unzip: Pakk ut zip-filer"
echo "  - vim: Teksteditor"
```

Foreløpig fungerer denne installasjonsfilen kun med Debian/Ubuntu med pakkehåndtereren apt. Endringer på dette utfører jeg først når utfordringen kommer.

Og det er klart at jeg ikke kan installere Git med denne filen i et operativsystem som mangler Git, siden jeg ikke kan klone repoet uten. Da må jeg i så fall kopiere den over på annet vis, via en minnepenn for eksempel.

Nå er i alle fall grunnlaget skapt, og utviklingen kan følges her:

- [Dotfiles](https://github.com/MichaelHelgesen/dotfiles)
- [Homelab](https://github.com/MichaelHelgesen/homelab) 
