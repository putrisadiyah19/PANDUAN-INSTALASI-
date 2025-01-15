CREATE DATABASE gudang_barang;
USE gudang_barang;

-- Tabel kategori barang
CREATE TABLE Tabel_kategori_barang (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100) NOT NULL,
    deskripsi TEXT
);

-- Tabel barang
CREATE TABLE Tabel_barang (
    id_barang INT AUTO_INCREMENT PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    harga_satuan DECIMAL(10, 2) NOT NULL,
    stok_tersedia INT NOT NULL,
    id_kategori INT,
    FOREIGN KEY (id_kategori) REFERENCES Tabel_kategori_barang(id_kategori)
);

-- Tabel supplier
CREATE TABLE Tabel_supplier (
    id_supplier INT AUTO_INCREMENT PRIMARY KEY,
    nama_supplier VARCHAR(100) NOT NULL,
    alamat TEXT,
    email VARCHAR(100),
    kontak VARCHAR(20)
);

-- Tabel user
CREATE TABLE Tabel_user (
    id_pengguna INT AUTO_INCREMENT PRIMARY KEY,
    nama_pengguna VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    sandi VARCHAR(255) NOT NULL,
    role ENUM('admin', 'staff', 'manager') NOT NULL
);

-- Tabel transaksi masuk
CREATE TABLE Tabel_transaksi_masuk (
    id_transaksi_masuk INT AUTO_INCREMENT PRIMARY KEY,
    id_barang INT,
    id_supplier INT,
    id_pengguna INT,
    tanggal_masuk DATE NOT NULL,
    jumlah INT NOT NULL,
    harga_total DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (id_barang) REFERENCES Tabel_barang(id_barang),
    FOREIGN KEY (id_supplier) REFERENCES Tabel_supplier(id_supplier),
    FOREIGN KEY (id_pengguna) REFERENCES Tabel_user(id_pengguna)
);

-- Tabel transaksi keluar
CREATE TABLE Tabel_transaksi_keluar (
    id_transaksi_keluar INT AUTO_INCREMENT PRIMARY KEY,
    id_barang INT,
    id_pengguna INT,
    tanggal_keluar DATE NOT NULL,
    jumlah INT NOT NULL,
    tujuan TEXT,
    FOREIGN KEY (id_barang) REFERENCES Tabel_barang(id_barang),
    FOREIGN KEY (id_pengguna) REFERENCES Tabel_user(id_pengguna)
);