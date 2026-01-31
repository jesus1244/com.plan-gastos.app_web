#!/usr/bin/env python3
"""
Servidor simple para persistir datos del plan de gastos
Uso: python3 server_gastos.py
Luego abre: http://localhost:5000
"""

from flask import Flask, jsonify, request, send_file
from flask_cors import CORS
import json
import os

app = Flask(__name__)
CORS(app)  # Permitir CORS para desarrollo local

DATA_FILE = 'plan_gastos_data.json'

@app.route('/')
def index():
    """Servir el HTML principal"""
    return send_file('plan_gastos.html')

@app.route('/api/data', methods=['GET'])
def get_data():
    """Obtener los datos actuales"""
    try:
        if os.path.exists(DATA_FILE):
            with open(DATA_FILE, 'r', encoding='utf-8') as f:
                data = json.load(f)
            return jsonify(data)
        else:
            # Datos por defecto si no existe el archivo
            default_data = {
                "months": {},
                "defaultIncome": 3000000,
                "defaultExtraIncome": [],
                "defaultExpenses": [
                    {"name": "Servicios", "amount": 350000},
                    {"name": "Universidad", "amount": 0},
                    {"name": "Tarjeta", "amount": 0},
                    {"name": "Computador", "amount": 100000},
                    {"name": "Ayudar casa", "amount": 0},
                    {"name": "Sistecredito", "amount": 0},
                    {"name": "Plan celular", "amount": 0},
                    {"name": "Ahorro", "amount": 0},
                    {"name": "Cuota inicial casa", "amount": 406000}
                ]
            }
            return jsonify(default_data)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/api/data', methods=['POST'])
def save_data():
    """Guardar los datos"""
    try:
        data = request.get_json()
        with open(DATA_FILE, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
        return jsonify({"success": True, "message": "Datos guardados correctamente"})
    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500

if __name__ == '__main__':
    print("=" * 60)
    print("🚀 Servidor de Plan de Gastos iniciado")
    print("=" * 60)
    print(f"📂 Archivo de datos: {DATA_FILE}")
    print(f"🌐 Abre en tu navegador: http://localhost:8000")
    print("⏹️  Presiona Ctrl+C para detener el servidor")
    print("=" * 60)
    app.run(debug=True, host='0.0.0.0', port=8000)
