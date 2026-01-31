# 🔥 Guía de Configuración Firebase

## Paso 1: Crear Proyecto en Firebase

1. Ve a [Firebase Console](https://console.firebase.google.com/)
2. Haz clic en **"Agregar proyecto"** o **"Add project"**
3. Ingresa un nombre (ejemplo: "plan-gastos")
4. (Opcional) Puedes deshabilitar Google Analytics si no lo necesitas
5. Haz clic en **"Crear proyecto"**

---

## Paso 2: Configurar Aplicación Web

1. En la página de inicio del proyecto, haz clic en el ícono **</> (Web)**
2. Registra la aplicación con un nombre (ejemplo: "Plan Gastos Web")
3. **NO** marques "Firebase Hosting" por ahora
4. Haz clic en **"Registrar app"**

### Copiar Configuración

Verás un código similar a este:

```javascript
const firebaseConfig = {
  apiKey: "AIzaSyXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
  authDomain: "plan-gastos-12345.firebaseapp.com",
  projectId: "plan-gastos-12345",
  storageBucket: "plan-gastos-12345.appspot.com",
  messagingSenderId: "123456789012",
  appId: "1:123456789012:web:abcdef1234567890"
};
```

**✅ COPIA estos valores** y pégalos en tu archivo `firebase-config.js`

---

## Paso 3: Habilitar Firebase Authentication

1. En el menú lateral, ve a **"Build"** → **"Authentication"**
2. Haz clic en **"Get started"** o **"Comenzar"**
3. En la pestaña **"Sign-in method"** (Método de acceso)
4. Haz clic en **"Email/Password"** (Correo electrónico/Contraseña)
5. **Activa el toggle** de "Enable" (Habilitar)
6. Guarda los cambios

---

## Paso 4: Configurar Firestore Database

1. En el menú lateral, ve a **"Build"** → **"Firestore Database"**
2. Haz clic en **"Create database"** (Crear base de datos)
3. Selecciona **"Start in production mode"** (iniciar en modo producción)
4. Haz clic en **"Next"**
5. Selecciona una ubicación (recomendado: **us-central1** o la más cercana a ti)
6. Haz clic en **"Enable"**

### Configurar Reglas de Seguridad

1. Ve a la pestaña **"Rules"** (Reglas)
2. **Reemplaza** todo el contenido con las reglas del archivo `firestore.rules` (ver Paso 5)
3. Haz clic en **"Publish"** (Publicar)

---

## Paso 5: Aplicar Reglas de Seguridad

Copia estas reglas en la pestaña **Rules** de Firestore:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Solo usuarios autenticados pueden acceder a sus propios datos
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

Estas reglas aseguran que:
- ✅ Solo usuarios autenticados pueden leer/escribir datos
- ✅ Cada usuario solo puede acceder a SUS PROPIOS datos
- ❌ Un usuario NO puede ver los datos de otro usuario

---

## Paso 6: Estructura de Datos en Firestore

Tu base de datos se organizará automáticamente así:

```
users (colección)
  └── {userId} (documento - ID único del usuario)
      ├── defaultIncome: 3000000
      ├── defaultExtraIncome: []
      ├── defaultExpenses: [...]
      ├── createdAt: timestamp
      ├── updatedAt: timestamp
      └── months (objeto)
          └── month_1234567890 (objeto)
              ├── name: "Enero 2024"
              ├── baseIncome: 3000000
              ├── extraIncome: [...]
              ├── expenses: [...]
              ├── otherExpenses: [...]
              └── overtime: { days: {...} }
```

---

## Paso 7: Abrir la Aplicación

Una vez configurado todo:

1. Abre el archivo **`plan_gastos_firebase.html`** en tu navegador
2. Verás la pantalla de login
3. Haz clic en **"Registrarse"** para crear tu primera cuenta
4. Ingresa tu email y una contraseña (mínimo 6 caracteres)
5. ¡Listo! Ya puedes usar la app

---

## 🎯 Resumen de Archivos

- **`plan_gastos_firebase.html`** → Aplicación con Firebase integrado
- **`firebase-config.js`** → Tu configuración de Firebase (⚠️ NO compartir)
- **`firestore.rules`** → Reglas de seguridad para copiar en Firebase Console
- **`FIREBASE_SETUP.md`** → Esta guía

---

## 🔒 Seguridad

### Importante:
- ✅ Las reglas de Firestore aseguran que cada usuario solo vea SUS datos
- ✅ La autenticación de Firebase es segura
- ⚠️ **NO** subas `firebase-config.js` a GitHub público
- ⚠️ Si usas Git, agrega esto a tu `.gitignore`:

```
firebase-config.js
```

---

## 💰 Costos

Firebase tiene un **plan gratuito (Spark)** que incluye:

- ✅ **Authentication:** 10,000 verificaciones/mes (gratis)
- ✅ **Firestore:** 50,000 lecturas/día (gratis)
- ✅ **Firestore:** 20,000 escrituras/día (gratis)
- ✅ **Almacenamiento:** 1 GB (gratis)

Para uso personal, el plan gratuito es **MÁS que suficiente**.

---

## 🆘 Solución de Problemas

### Error: "Firebase not defined"
- Verifica que `firebase-config.js` esté en la misma carpeta que el HTML
- Asegúrate de haber pegado tu configuración real

### Error: "Missing or insufficient permissions"
- Verifica que las reglas de Firestore estén publicadas correctamente
- Asegúrate de estar autenticado (login exitoso)

### No puedo registrarme
- Verifica que Email/Password esté habilitado en Authentication
- La contraseña debe tener al menos 6 caracteres
- Revisa la consola del navegador (F12) para ver errores específicos

---

## 📱 Acceso desde Múltiples Dispositivos

Una vez configurado, puedes:

1. Abrir `plan_gastos_firebase.html` desde cualquier navegador
2. Iniciar sesión con tu email/contraseña
3. Tus datos estarán sincronizados en tiempo real
4. Los cambios en un dispositivo se reflejan instantáneamente en otros

---

## 🚀 Próximos Pasos (Opcional)

### Hacer la app accesible desde internet:

1. Ve a **"Hosting"** en Firebase Console
2. Instala Firebase CLI: `npm install -g firebase-tools`
3. Inicia sesión: `firebase login`
4. Inicializa hosting: `firebase init hosting`
5. Despliega: `firebase deploy`

Tu app estará disponible en: `https://tu-proyecto.web.app`

---

## 📧 Recuperación de Contraseña

Firebase maneja automáticamente la recuperación de contraseña. Si deseas agregar esta función:

1. En el HTML de login, agrega un botón "¿Olvidaste tu contraseña?"
2. Usa este código:

```javascript
firebase.auth().sendPasswordResetEmail(email)
  .then(() => {
    alert('Correo de recuperación enviado');
  });
```

---

¡Listo! Ahora tienes una app de gastos con usuarios, autenticación y base de datos en la nube 🎉
