FROM python:3.10-slim

WORKDIR /app

COPY server/ ./server
COPY requirements.txt ./
COPY start.sh ./

RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir Pillow==9.5.0 && \
    pip install --no-cache-dir paddleocr==2.7.3 --no-deps

RUN chmod +x start.sh
RUN mkdir -p media

EXPOSE 8000

CMD ["./start.sh"]
