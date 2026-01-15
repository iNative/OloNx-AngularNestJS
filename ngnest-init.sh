#!/bin/bash
# CONFIGURAZIONE E COLORI
VS_BLUE='\033[1;34m'
VS_GREEN='\033[1;32m'
VS_RED='\033[1;31m'
VS_YELLOW='\033[1;33m'
NC='\033[0m'

# Gestione errori robusta
set -e
set -o pipefail

# 1. RACCOLTA DATI (INPUT UTENTE)
PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
    echo -e -n "${VS_BLUE}➤ Inserisci il nome del Workspace (cartella root): ${NC}"
    read PROJECT_NAME
fi

if [ -z "$PROJECT_NAME" ]; then
    echo -e "${VS_RED}❌ Errore: Nome progetto mancante.${NC}"
    exit 1
fi

echo -e -n "${VS_BLUE}➤ Inserisci nome App Angular [default: frontend]: ${NC}"
read FRONTEND_INPUT
FRONTEND_APP_NAME=${FRONTEND_INPUT:-frontend}

echo -e -n "${VS_BLUE}➤ Inserisci nome App NestJS [default: backend]: ${NC}"
read BACKEND_INPUT
BACKEND_APP_NAME=${BACKEND_INPUT:-backend}

echo -e "\n${VS_YELLOW}------------------------------------------------${NC}"
echo -e "🚀 RIEPILOGO: Workspace: $PROJECT_NAME | Front: $FRONTEND_APP_NAME | Back: $BACKEND_APP_NAME"
echo -e "${VS_YELLOW}------------------------------------------------${NC}\n"

# Check prerequisiti
if ! command -v node &> /dev/null; then
    echo -e "${VS_RED}❌ Errore: Node.js non installato.${NC}"
    exit 1
fi

echo -e "${VS_BLUE}➤ Creazione Workspace Nx...${NC}"
npx create-nx-workspace@latest "$PROJECT_NAME" --preset=apps --packageManager=npm --nxCloud=skip --yes
cd "$PROJECT_NAME" || exit

echo -e "\n${VS_BLUE}➤ Installazione Plugin e Fix Dipendenze...${NC}"
# Aggiungiamo esplicitamente @swc/core e @swc/helpers per allinearli alle richieste di Nest
npm install -D @nx/angular @nx/nest @nx/js @swc/core@latest @swc/helpers@latest

echo -e "\n${VS_BLUE}➤ Configurazione Defaults (nx.json)...${NC}"
# Inietta regole in nx.json per forzare SCSS e Jest su tutti i futuri componenti
node -e "
const fs = require('fs');
const fileName = 'nx.json';
try {
    const nxJson = JSON.parse(fs.readFileSync(fileName, 'utf8'));
    nxJson.generators = nxJson.generators || {};
    nxJson.generators['@nx/angular:component'] = { style: 'scss', inlineStyle: false };
    nxJson.generators['@nx/angular:library'] = { linter: 'eslint', unitTestRunner: 'jest' };
    fs.writeFileSync(fileName, JSON.stringify(nxJson, null, 2));
} catch (e) { process.exit(1); }
"

echo -e "\n${VS_BLUE}➤ Generazione Frontend: $FRONTEND_APP_NAME...${NC}"
npx nx g @nx/angular:application \
  --name="$FRONTEND_APP_NAME" \
  --directory="apps/$FRONTEND_APP_NAME" \
  --style=scss --routing --e2eTestRunner=cypress --bundler=esbuild --ssr=false --unitTestRunner=jest --no-interactive

echo -e "\n${VS_BLUE}➤ Generazione Backend: $BACKEND_APP_NAME...${NC}"
npx nx g @nx/nest:application \
  --name="$BACKEND_APP_NAME" \
  --directory="apps/$BACKEND_APP_NAME" \
  --frontendProject="$FRONTEND_APP_NAME" \
  --unitTestRunner=jest --no-interactive

echo -e "\n${VS_BLUE}➤ Generazione Lib Shared...${NC}"
npx nx g @nx/js:library --name=shared-data --directory=libs/shared-data --bundler=tsc --importPath="@$PROJECT_NAME/shared-data" --unitTestRunner=jest --no-interactive

echo -e "\n${VS_GREEN}✅ SETUP COMPLETATO!${NC}"
