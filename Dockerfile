FROM python:3.12





# Crear un entorno virtual y configurarlo como predeterminado
RUN pip install --no-cache-dir virtualenv
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Definir el directorio de trabajo y copiar el código al contenedor
WORKDIR /app
COPY koyeb/dummy_server.py /app/dummy_server.py
COPY ../ .

# Instalar las dependencias del proyecto
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements_prod.txt

RUN pip install flask

# Comando de inicio para el worker de Celery y el dummy server
CMD ["sh", "-c", "python app.py"]

EXPOSE $PORT