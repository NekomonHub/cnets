#!/data/data/com.termux/files/usr/bin/bash

clear
unzip cnets.zip
echo "[+] Mengecek dependensi..."

packages=("nodejs-lts" "git")

for pkg in "${packages[@]}"; do
    if ! command -v ${pkg%%-*} >/dev/null 2>&1; then
        echo "[*] ${pkg} belum terpasang. Menginstal..."
        pkg install -y $pkg
    else
        echo "[√] ${pkg} sudah terpasang."
    fi
done

# Kadang nodejs-lts dan nodejs bisa bentrok, jadi pastikan minimal salah satu ada
if ! command -v node >/dev/null 2>&1; then
    echo "[!] Node.js tidak ditemukan, mencoba pasang versi default..."
    pkg install -y nodejs
fi

clear
echo "[+] Menjalankan npm install..."
npm install

if [ $? -eq 0 ]; then
    clear
    echo "[+] npm install selesai, menjalankan npm start..."
    npm start
else
    echo "[!] Terjadi kesalahan saat npm install."
fi
