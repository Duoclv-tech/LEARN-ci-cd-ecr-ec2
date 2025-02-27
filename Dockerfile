# Sử dụng image Node.js phiên bản LTS
FROM node:22.14.0 

# Cài đặt Yarn
# RUN npm install -g yarn

# Tạo thư mục làm việc
WORKDIR /app

# Copy package.json và yarn.lock
COPY package.json yarn.lock ./

# Cài đặt các dependencies bằng Yarn
RUN yarn install --frozen-lockfile

# Copy toàn bộ mã nguồn
COPY . .

# Build ứng dụng NestJS
RUN yarn build

# Expose port (thay đổi nếu cần)
EXPOSE 3000

# Chạy ứng dụng
CMD ["yarn", "start:prod"]