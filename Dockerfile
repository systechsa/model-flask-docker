# Imagen base oficial de Python
FROM python:3.10-slim

# Crear directorio de trabajo
WORKDIR /app

# Copiar los archivos necesarios
COPY run.py .
COPY model01.pkl .
COPY vector.pickel .
COPY requirements.txt .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

RUN python -m nltk.downloader punkt punkt_tab stopwords averaged_perceptron_tagger

# Exponer el puerto 8080
EXPOSE 8080

# Comando para iniciar la app
CMD ["python", "run.py"]
