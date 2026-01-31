# Plan de Gastos - Servidor Local

Sistema de gestión de gastos mensuales con persistencia automática en archivo JSON.

## 🚀 Inicio Rápido

### Opción 1: Script automático (Recomendado)
```bash
./iniciar.sh
```

### Opción 2: Manual
```bash
# Instalar dependencias (solo la primera vez)
pip3 install flask flask-cors

# Iniciar servidor
python3 server_gastos.py
```

## 📖 Uso

1. **Inicia el servidor** con uno de los métodos anteriores
2. **Abre tu navegador** en: http://localhost:8000
3. **Gestiona tus gastos** - Los datos se guardan automáticamente en `plan_gastos_data.json`

## ✨ Características

### Automático
- ✅ **Auto-guardado**: Cada cambio se guarda instantáneamente en el archivo JSON
- ✅ **Backup local**: También guarda en localStorage del navegador como respaldo
- ✅ **Modo offline**: Si el servidor no está disponible, usa localStorage

### Manual
- 📥 **Exportar**: Descarga una copia de tus datos
- 📤 **Importar**: Carga datos desde un archivo JSON

## 🔧 Arquitectura

```
┌─────────────┐         ┌──────────────┐         ┌─────────────────┐
│  Navegador  │ ◄─────► │   Servidor   │ ◄─────► │ JSON File       │
│  (HTML/JS)  │         │   (Python)   │         │ (Disco duro)    │
└─────────────┘         └──────────────┘         └─────────────────┘
      ↓                                                    
┌─────────────┐                                            
│ localStorage│ (Backup)                                   
└─────────────┘                                            
```

## 🛑 Detener el Servidor

Presiona `Ctrl + C` en la terminal donde está corriendo el servidor.

## 📝 Archivos

- `plan_gastos.html` - Aplicación web
- `server_gastos.py` - Servidor Python con Flask
- `plan_gastos_data.json` - Base de datos (se crea automáticamente)
- `iniciar_servidor.sh` - Script de inicio automático

## 🔐 Seguridad

El servidor solo es accesible localmente (localhost). No está expuesto a internet.

## 💡 Nota sobre el puerto

El servidor usa el puerto **8000** en lugar del 5000 para evitar conflictos con AirPlay Receiver en macOS.

## ❓ Solución de Problemas

### El servidor no inicia
```bash
# Verificar que Flask está instalado
pip3 install flask flask-cors

# Verificar que el puerto 8000 está libre
lsof -i :8000
```

### Los cambios no se guardan
- Verifica que el servidor esté corriendo
- Revisa la consola del navegador (F12) para ver mensajes de error
- Los datos se respaldan en localStorage automáticamente
