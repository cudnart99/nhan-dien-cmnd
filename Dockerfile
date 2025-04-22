# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy source code and requirements
COPY server/ ./server
COPY requirements.txt ./
COPY start.sh ./

# Install system dependencies (libGL for OpenCV)
RUN apt-get update && apt-get install -y libgl1-mesa-glx && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir paddleocr==2.7.3 --no-deps

# Make start.sh executable
RUN chmod +x start.sh

# Create media folder to store uploaded files/images
RUN mkdir -p media

# Expose Django port
EXPOSE 8000

# Default command
CMD ["./start.sh"]
