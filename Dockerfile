FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Use Cloud Run default port
ENV PORT=8080

# Run Gunicorn on the correct host and port
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
