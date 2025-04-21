# Sử dụng base image
FROM python:3.10-slim

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy code vào container
COPY server/ ./server
COPY requirements.txt ./
COPY start.sh ./

# Cài đặt các thư viện Python
RUN pip install --no-cache-dir -r requirements.txt

# Cấp quyền thực thi cho start.sh
RUN chmod +x start.sh

# Tạo thư mục media để lưu ảnh
RUN mkdir -p media

# Expose port 80
EXPOSE 80

# Command mặc định
CMD ["./start.sh"]
