# Triforce Nx Init `v8.0`

**The "Triforce" Architecture Automation:** Angular (Admin), React (Public), NestJS (Core).

## > 📖 Full Documentation
For the visual guide and Master Log, open <a href="https://inative.github.io/triforce-nx/" target="_blank">docs/index.html</a> in your browser.

## 💡 Why "Triforce Nx"?

We evolved from a simple Full Stack setup to a specialized **Multi-Head Architecture**:

* **⚛️ React (Public Site):** High-performance, SEO-friendly, dynamic content rendering via Vite.
* **🅰️ Angular (Admin Panel):** Robust, opinionated framework perfect for complex back-office forms and management.
* **🦅 NestJS (Core):** The centralized brain. Handles API, Multi-Tenancy resolution, and Asset Proxying.

## ✨ Key Features

### 🛡️ End-to-End Type Safety
The superpower of this monorepo. TypeScript interfaces live in a shared library (`libs/shared-data`). If you modify a DTO in the Backend, **both** the React and Angular apps break at compile time before you can commit.

### ⚡ Standardization
* **React:** Vite + SCSS Modules + Vitest.
* **Angular:** Esbuild + SCSS + Jest + Cypress.
* **NestJS:** Standard Architecture (Controller/Service/DTO).

### 🚀 Developer Experience
Scalable folder structure, smart caching, and explicit port management strategies (:3000, :4200, :4201).

## 🔌 Port Strategy

| App | Port | Role |
| :--- | :--- | :--- |
| **Backend** | `:3000` | API & Static Assets Source |
| **Public Site** | `:4200` | Public Frontend (Proxies to :3000) |
| **Admin Panel** | `:4201` | Back-office Management |

## 🐛 Troubleshooting

* **Error `$'\r': command not found`:** The script has Windows line endings (CRLF). Run `dos2unix triforce-nx.sh`.
* **Node Permissions:** If you get `EACCES`, use **NVM** instead of root Node.

---
© 2026 Guido Filippo Serio - Script Version 8.0
