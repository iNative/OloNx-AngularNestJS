# NgNest Init `v7.3`

Automazione Monorepo Nx per Angular & NestJS.


## > 📖 **Documentazione Completa:** Per la guida visuale e il Master Log, apri <a href="https://inative.github.io/ngnest-init/" target="_blank">docs/index.html</a> nel tuo browser.

## 💡 Why this Architecture?

Più che un semplice boilerplate, questo è un framework operativo progettato per risolvere problemi reali dei team Full Stack:

* **Zero "Context Switching":** Frontend e Backend condividono gli stessi modelli TypeScript. Modifichi l'API? Il client si aggiorna (o si rompe in build-time).
* **Onboarding Istantaneo:** Lo script di init e la documentazione interattiva riducono il setup dell'ambiente da giorni a minuti.
* **Documentation as Code:** La documentazione inclusa (`docs/`) non è statica. Include funzionalità interattive (Scope Injection) che adattano gli snippet di codice al nome del tuo progetto in tempo reale, eliminando gli errori di copia-incolla.

## ✨ Key Features

### 🛡️ End-to-End Type Safety
Il superpotere di questa architettura. Le interfacce TypeScript vivono in una libreria condivisa. Se modifichi un DTO nel Backend, il Frontend **si rompe in compilazione** prima ancora che tu possa committare.

### ⚡ Standardization
Configurazione automatica di **SCSS**, **Esbuild** e **Jest** per ogni nuovo componente generato.

### 🚀 Developer Experience
Struttura a cartelle scalabile, caching intelligente e naming convention forzate via script.


## 🐛 Troubleshooting

* **Errore `$'\r': command not found`:** Il file ha terminatori Windows (CRLF). Esegui `dos2unix ngnest-init.sh` o converti in LF dal tuo editor.
* **Errore `npm error Invalid URL`:** Causato anch'esso dai terminatori Windows. Converti in LF.
* **Node Permissions:** Se ricevi `EACCES`, significa che stai usando Node di root. Usa **NVM** con il tuo utente standard.

---
© 2026 Guido Filippo Serio - Script Version 7.3
