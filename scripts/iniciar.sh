#!/bin/bash

# Script simple para iniciar Plan de Gastos

clear
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║           💰 PLAN DE GASTOS - INICIANDO...              ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Ir al directorio del script
cd "$(dirname "$0")"

# Verificar dependencias
echo "🔍 Verificando dependencias..."
if ! python3 -c "import flask, flask_cors" 2>/dev/null; then
    echo "📦 Instalando dependencias necesarias..."
    pip3 install flask flask-cors > /dev/null 2>&1
    echo "✅ Dependencias instaladas"
fi

echo "🚀 Iniciando servidor..."

# Iniciar servidor en segundo plano
python3 server_gastos.py > /dev/null 2>&1 &
SERVER_PID=$!

# Guardar PID para poder detenerlo después
echo $SERVER_PID > .server_pid

# Esperar a que el servidor esté listo
sleep 2

# Verificar que el servidor inició correctamente
if kill -0 $SERVER_PID 2>/dev/null; then
    echo "✅ Servidor iniciado (PID: $SERVER_PID)"
    echo "🌐 Abriendo navegador..."
    
    # Abrir navegador según el sistema operativo
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        open http://localhost:8000
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        xdg-open http://localhost:5000
    else
        # Windows (Git Bash)
        start http://localhost:8000
    fi
    
    echo ""
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║                    ✅ TODO LISTO                         ║"
    echo "╠═══════════════════════════════════════════════════════════╣"
    echo "║  📱 URL: http://localhost:8000                           ║"
    echo "║  💾 Guardado automático habilitado                       ║"
    echo "║                                                           ║"
    echo "║  ⏹️  PARA DETENER:                                       ║"
    echo "║     ./detener_servidor.sh                                ║"
    echo "║     o presiona Ctrl+C                                    ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo ""
    
    # Mantener el script corriendo
    trap "kill $SERVER_PID 2>/dev/null; rm -f .server_pid; echo ''; echo '👋 Servidor detenido'; exit" INT TERM
    wait $SERVER_PID
else
    echo "❌ Error: El servidor no pudo iniciar"
    echo "Intenta ejecutar manualmente: python3 server_gastos.py"
    exit 1
fi
