# Base image
FROM python:3.10-slim

WORKDIR /app

COPY server/ ./server
COPY requirements.txt ./
COPY start.sh ./

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --upgrade pip && \
    pip install numpy==1.23.5 && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir paddleocr==2.7.3 --no-deps

RUN chmod +x start.sh
RUN mkdir -p media

EXPOSE 8000
CMD ["./start.sh"]
