# Plan de Gastos Mensuales

Aplicación web para gestionar gastos mensuales con Firebase.

## 📁 Estructura del Proyecto

```
Gastos/
├── public/              # Aplicación principal (desplegable)
│   ├── index.html       # Aplicación web
│   ├── firebase-config.js
│   └── firestore.rules
├── scripts/             # Scripts de utilidad
│   ├── iniciar_servidor.sh
│   ├── detener_servidor.sh
│   ├── iniciar.sh
│   └── server_gastos.py
├── docs/                # Documentación
│   ├── FIREBASE_SETUP.md
│   ├── DESPLEGAR_FIREBASE.md
│   └── README_SERVIDOR.md
├── data/                # Datos locales (no subir a git)
├── backups/             # Respaldos (no subir a git)
├── firebase.json        # Configuración Firebase
├── .firebaserc          # Proyectos Firebase
└── .gitignore

```

## 🚀 Inicio Rápido

```bash
# Iniciar servidor local
./scripts/iniciar_servidor.sh

# Detener servidor
./scripts/detener_servidor.sh
```

## 📚 Documentación

- [Configuración Firebase](docs/FIREBASE_SETUP.md)
- [Desplegar en Firebase](docs/DESPLEGAR_FIREBASE.md)
- [Servidor Local](docs/README_SERVIDOR.md)

## 🔧 Tecnologías

- HTML5, CSS3, JavaScript
- Firebase (Hosting + Firestore)
- Python (servidor local)
