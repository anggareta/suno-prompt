# Gunakan image resmi Node.js versi LTS
FROM node:18-alpine

# Tentukan direktori kerja di dalam container
WORKDIR /app

# Salin package.json dan package-lock.json (jika ada) terlebih dahulu
COPY package*.json ./

# Install dependensi (hanya production)
RUN npm ci --only=production

# Salin seluruh kode aplikasi dan folder public ke dalam container
COPY . .

# Port yang digunakan oleh aplikasi Express
EXPOSE 3000

# Perintah untuk menjalankan aplikasi
CMD ["node", "server.js"]