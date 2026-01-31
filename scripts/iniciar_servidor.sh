#!/bin/bash

# Script para iniciar el servidor de Plan de Gastos y abrir el navegador

echo "🔧 Verificando dependencias..."

# Verificar si Flask está instalado
if ! python3 -c "import flask" 2>/dev/null; then
    echo "📦 Instalando Flask..."
    pip3 install flask flask-cors
fi

echo ""
echo "🚀 Iniciando servidor..."
echo ""

# Iniciar el servidor en segundo plano
python3 server_gastos.py &
SERVER_PID=$!

# Esperar a que el servidor esté listo
sleep 2

# Abrir el navegador
echo "🌐 Abriendo navegador..."
open http://localhost:8000

echo ""
echo "✅ Servidor iniciado correctamente"
echo "📱 Si el navegador no se abrió, ve a: http://localhost:8000"
echo ""
echo "⏹️  Para detener el servidor, presiona Ctrl+C o ejecuta:"
echo "   kill $SERVER_PID"
echo ""

# Esperar a que el proceso termine (mantiene el script corriendo)
wait $SERVER_PID
