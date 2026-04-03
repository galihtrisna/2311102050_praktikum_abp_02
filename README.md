# Tugas Praktikum - APLIKASI BERBASIS PLATFORM (ABP)

Repository ini berisi *source code* untuk tugas praktikum mata kuliah APLIKASI BERBASIS PLATFORM.

## Praktikum Pertemuan 01
Halaman web interaktif bertema Ramadan menggunakan Bootstrap 5. 

Halaman web ini menampilkan:
* Ucapan menyambut bulan suci Ramadan.
* Tombol interaktif "Buka Kejutan" yang jika diklik akan menampilkan *modal pop-up* berisi pesan "Selamat! Anda dapat Tiket Surga VVIP!".

### Screenshot Hasil
![Screenshot Halaman Web](/2311102050_Pertemuan01/preview.png)

---

## Praktikum Pertemuan 03
Sistem Penilaian Mahasiswa menggunakan PHP untuk mengolah data nilai secara dinamis.

**Fitur & Logika Program:**
* **Data Management:** Menggunakan **Array Asosiasi** untuk menyimpan data Nama, NIM, serta Nilai (Tugas, UTS, UAS).
* **Modular Function:** * `hitungNilaiAkhir()`: Menghitung bobot Tugas (30%), UTS (30%), dan UAS (40%).
    * `menentukanGrade()`: Logika percabangan `if-elseif` untuk konversi nilai ke Grade A-E.
    * `menentukanStatus()`: Menggunakan *Ternary Operator* untuk menentukan status Lulus/Tidak Lulus (Threshold: 60).
* **Dynamic Table:** Implementasi `foreach` loop untuk merender data dari array ke dalam tabel HTML dengan styling Bootstrap.
* **Class Statistics:** Menampilkan ringkasan otomatis berupa Rata-rata Nilai Kelas dan Nilai Tertinggi yang didapat mahasiswa.

### Screenshot Hasil
![Screenshot Sistem Penilaian](/2311102050_Pertemuan03/preview.png)

<br>
<p align="center">Made with ❤️ by <b>Galih Trisna</b><br>2311102050</p>