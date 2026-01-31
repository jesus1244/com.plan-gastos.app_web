# 🚀 Cómo Desplegar tu App en Firebase Hosting

Una vez desplegada, podrás acceder desde **cualquier dispositivo** (celular, tablet, PC) usando una URL como:
```
https://plan-gastos.web.app
```

---

## 📋 Requisitos

- Node.js instalado (para Firebase CLI)
- Proyecto Firebase ya configurado
- Terminal/Línea de comandos

---

## 🛠️ Paso 1: Instalar Firebase CLI

Abre la terminal y ejecuta:

```bash
npm install -g firebase-tools
```

Si tienes problemas de permisos en macOS/Linux:
```bash
sudo npm install -g firebase-tools
```

---

## 🔐 Paso 2: Iniciar Sesión en Firebase

```bash
firebase login
```

Se abrirá tu navegador para que inicies sesión con tu cuenta de Google.

---

## 📁 Paso 3: Inicializar Firebase Hosting

Navega a la carpeta de tu proyecto:

```bash
cd /Users/jesus/Documents/personal_stuffs/Gastos
```

Inicializa Firebase Hosting:

```bash
firebase init hosting
```

Responde las preguntas así:

1. **"Please select an option:"** → `Use an existing project`
2. **"Select a default Firebase project:"** → Selecciona `plan-gastos` (tu proyecto)
3. **"What do you want to use as your public directory?"** → Escribe: `public` y presiona Enter
4. **"Configure as a single-page app?"** → `Yes` (y)
5. **"Set up automatic builds and deploys with GitHub?"** → `No` (n)
6. **"File public/index.html already exists. Overwrite?"** → `No` (n)

---

## 📂 Paso 4: Preparar Archivos para Desplegar

Crea la carpeta `public` y mueve tus archivos:

```bash
mkdir -p public
cp plan_gastos_firebase.html public/index.html
cp firebase-config.js public/
cp firestore.rules .
```

---

## 🚀 Paso 5: Desplegar

```bash
firebase deploy
```

Espera unos segundos y verás algo como:

```
✔  Deploy complete!

Project Console: https://console.firebase.google.com/project/plan-gastos/overview
Hosting URL: https://plan-gastos.web.app
```

---

## 📱 Paso 6: Acceder desde tu Celular

1. **Copia la URL** que te dio Firebase (ejemplo: `https://plan-gastos.web.app`)
2. **Abre el navegador** en tu celular
3. **Pega la URL** y presiona Enter
4. **Inicia sesión con Google**
5. ¡Listo! Ya puedes usar la app desde tu celular

---

## 🔄 Actualizar la App (después de hacer cambios)

Cada vez que hagas cambios en el código:

```bash
# 1. Actualizar el archivo en public/
cp plan_gastos_firebase.html public/index.html

# 2. Desplegar de nuevo
firebase deploy
```

Los cambios se reflejarán en segundos.

---

## 🏠 Agregar la App a la Pantalla de Inicio (PWA)

### En iPhone/iPad:
1. Abre la app en Safari
2. Toca el botón de **Compartir** (📤)
3. Selecciona **"Agregar a pantalla de inicio"**
4. Dale un nombre y toca **"Agregar"**

### En Android:
1. Abre la app en Chrome
2. Toca los **tres puntos** (⋮) en la esquina superior derecha
3. Selecciona **"Agregar a pantalla de inicio"**
4. Toca **"Agregar"**

Ahora tendrás un ícono como si fuera una app nativa.

---

## 🔒 Agregar Dominio Personalizado (Opcional)

Si tienes un dominio propio (ejemplo: `misfinanzas.com`):

1. Ve a **Firebase Console** → **Hosting** → **Add custom domain**
2. Sigue las instrucciones para configurar DNS
3. Firebase te dará un certificado SSL gratis

---

## 💰 Costos de Firebase Hosting

**Plan Spark (Gratuito):**
- ✅ 10 GB de almacenamiento
- ✅ 360 MB/día de transferencia
- ✅ SSL gratis
- ✅ CDN global

Para uso personal, es **completamente gratis**.

---

## 🆘 Solución de Problemas

### Error: "Command not found: firebase"
- Instala Node.js desde [nodejs.org](https://nodejs.org)
- Luego ejecuta: `npm install -g firebase-tools`

### Error: "Authorization failed"
- Ejecuta: `firebase logout`
- Luego: `firebase login` de nuevo

### La app no carga después de desplegar
- Verifica que `firebase-config.js` esté en la carpeta `public/`
- Revisa la consola del navegador (F12) para ver errores

### Error: "auth/unauthorized-domain"
- Tu dominio ya está autorizado automáticamente al desplegar
- Si usas dominio personalizado, agrégalo en Firebase Console → Authentication → Settings → Authorized domains

---

## 📊 Ver Estadísticas de Uso

1. Ve a **Firebase Console**
2. Selecciona tu proyecto
3. Ve a **Hosting** en el menú lateral
4. Verás gráficas de:
   - Visitantes
   - Transferencia de datos
   - Peticiones por hora

---

## 🔄 Comandos Útiles

```bash
# Ver proyectos Firebase
firebase projects:list

# Ver el status del hosting
firebase hosting:channel:list

# Desplegar solo Firestore rules
firebase deploy --only firestore:rules

# Desplegar solo hosting
firebase deploy --only hosting
```

---

## 🎯 Resumen Rápido

```bash
# Instalación (solo una vez)
npm install -g firebase-tools
firebase login

# En la carpeta de tu proyecto
cd /Users/jesus/Documents/personal_stuffs/Gastos
firebase init hosting

# Preparar archivos
mkdir -p public
cp plan_gastos_firebase.html public/index.html
cp firebase-config.js public/

# Desplegar
firebase deploy

# Tu app estará en:
# https://plan-gastos.web.app
```

---

¡Listo! Ahora tu app está en la nube y puedes acceder desde cualquier dispositivo 🎉
