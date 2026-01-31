#!/bin/bash

# Script para detener el servidor de Plan de Gastos

if [ -f .server_pid ]; then
    SERVER_PID=$(cat .server_pid)
    
    if kill -0 $SERVER_PID 2>/dev/null; then
        echo "⏹️  Deteniendo servidor (PID: $SERVER_PID)..."
        kill $SERVER_PID
        sleep 1
        
        # Verificar que se detuvo
        if ! kill -0 $SERVER_PID 2>/dev/null; then
            echo "✅ Servidor detenido correctamente"
            rm -f .server_pid
        else
            echo "⚠️  Forzando detención..."
            kill -9 $SERVER_PID
            rm -f .server_pid
            echo "✅ Servidor detenido"
        fi
    else
        echo "ℹ️  El servidor no está corriendo"
        rm -f .server_pid
    fi
else
    echo "ℹ️  No hay servidor corriendo"
    echo "💡 Si hay un servidor corriendo, usa: pkill -f server_gastos.py"
fi
