# NgNest Init `v7.3`

Automazione Monorepo Nx per Angular & NestJS.


🛡️ End-to-End Type Safety

Il superpotere di questa architettura. Le interfacce TypeScript vivono in una libreria condivisa. Se modifichi un DTO nel Backend, il Frontend **si rompe in compilazione** prima ancora che tu possa committare.

⚡ Standardization

Configurazione automatica di **SCSS**, **Esbuild** e **Jest** per ogni nuovo componente generato.

🚀 Developer Experience

Struttura a cartelle scalabile, caching intelligente e naming convention forzate via script.

🚀 Quick Start: Inizializzazione
--------------------------------

Salva il seguente codice nel file `ngnest-init.sh`.  
Lo script gestisce interattivamente nomi, errori e configura i default del workspace.


Esegui il comando nel terminale: `bash ngnest-init.sh`
    

🔄 Workflow: Shared Types
-------------------------

> Definisci il dato una volta sola, usalo ovunque.

Grazie al `tsconfig` centralizzato, importi la lib come se fosse un pacchetto npm.



🐛 Troubleshooting
------------------

*   **Errore `$'\r': command not found`:** Il file ha terminatori Windows (CRLF). Esegui `dos2unix ngnest-init.sh` o converti in LF dal tuo editor.
*   **Errore `npm error Invalid URL`:** Causato anch'esso dai terminatori Windows. Converti in LF.
*   **Node Permissions:** Se ricevi `EACCES`, significa che stai usando Node di root. Usa **NVM** con il tuo utente standard.

© 2026 Guido Filippo Serio - Script Version 7.3
