# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy source code and requirements
COPY server/ ./server
COPY requirements.txt ./
COPY start.sh ./

# Install all dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make start.sh executable
RUN chmod +x start.sh

# Create media folder to store uploaded files/images
RUN mkdir -p media

# Expose Django port
EXPOSE 8000

# Default command
CMD ["./start.sh"]
