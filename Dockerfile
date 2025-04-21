# Sử dụng base image
FROM python:3.10-slim

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy mã nguồn và requirements
COPY server/ ./server
COPY requirements.txt ./
COPY start.sh ./

# Cài đặt các thư viện Python (trừ paddleocr)
RUN pip install --no-cache-dir -r requirements.txt \
    --no-deps && \
    pip install --no-cache-dir Pillow==9.5.0 && \
    pip install --no-cache-dir paddleocr==2.7.3 --no-deps

# Cấp quyền thực thi cho start.sh
RUN chmod +x start.sh

# Tạo thư mục media để lưu ảnh
RUN mkdir -p media

# Mở cổng 80
EXPOSE 80

# Command mặc định khi container chạy
CMD ["./start.sh"]
