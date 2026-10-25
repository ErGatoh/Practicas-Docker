# Imagen del sensor simulado
FROM python:3.13-slim

WORKDIR /app

# 1. Primero las dependencias: cambian poco y así su capa se reutiliza
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 2. Después el código: cambia a menudo
COPY simulador.py .

# Valores por defecto, que se pueden cambiar al arrancar el contenedor
ENV MQTT_HOST=mosquitto \
    SENSOR_ID=sensor01 \
    PERIODO=2

# No ejecutar como root
USER nobody

CMD ["python", "simulador.py"]
