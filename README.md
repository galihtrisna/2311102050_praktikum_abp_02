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

---

## Praktikum Pertemuan 04
Implementasi **AJAX** menggunakan `Fetch API` untuk mengambil data JSON tanpa reload halaman.

**Fitur:**
* **data.php**: API sederhana yang mengirim data dalam format JSON.
* **index.html**: Tampilan menggunakan Bootstrap 5.
* **AJAX Logic**: Menggunakan `fetch()` untuk mengambil data dan memperbarui DOM secara asinkron.

### Screenshot Hasil
![Screenshot AJAX Profile](/2311102050_Pertemuan04/preview.png)

---

## Praktikum Pertemuan 05
Sistem Inventaris Toko Pak Cokomi & Mas Wowo menggunakan Laravel, Inertia.js, dan React.

**Fitur:**
* **CRUD Produk**: Pengelolaan data produk lengkap (Create, Read, Update, Delete).
* **Authentication**: Sistem login dan registrasi menggunakan **Laravel Breeze**.
* **Database Factory & Seeder**: Generate data produk otomatis untuk pengujian.
* **UI/UX**: Tampilan modern dengan Data Table, Form yang responsif, dan Modal konfirmasi hapus.

### Screenshot Hasil
<div align="center">
  <img src="/2311102050_Pertemuan05/preview1.webp" width="45%" />
  <img src="/2311102050_Pertemuan05/preview2.webp" width="45%" />
  <img src="/2311102050_Pertemuan05/preview3.webp" width="45%" />
  <img src="/2311102050_Pertemuan05/preview4.webp" width="45%" />
  <img src="/2311102050_Pertemuan05/preview5.webp" width="45%" />
  <img src="/2311102050_Pertemuan05/preview6.webp" width="45%" />
  <img src="/2311102050_Pertemuan05/preview7.webp" width="45%" />
  <img src="/2311102050_Pertemuan05/preview8.webp" width="45%" />
  </div>

  ---

  ## Praktikum Pertemuan 07

  **Widget yang Diimplementasikan:**
  * **Layouting**: `Container` untuk styling/box model dan `Stack` untuk menumpuk elemen visual.
  * **Scrollable Views**: 
    * `GridView`: Menampilkan data dalam format grid 3 kolom.
    * `ListView`: List statis sederhana.
    * `ListView.builder`: Merender data array secara dinamis (Lazy Loading).
    * `ListView.separated`: List dengan pembatas (`Divider`) antar item.

  ### Screenshot Hasil
  <div align="center">
  <img src="/2311102050_Pertemuan07/preview1.png" width="30%" />
  <img src="/2311102050_Pertemuan07/preview2.png" width="30%" />
  <img src="/2311102050_Pertemuan07/preview3.png" width="30%" />
  </div>

  <br>
  <p align="center">Made with ❤️ by <b>Galih Trisna</b><br>2311102050</p>

  ---

  ## Praktikum Pertemuan 08
  Aplikasi Flutter yang mengintegrasikan **Hardware API** (Kamera & Galeri) dan **Notifikasi Lokal**.

  **Fitur & Widget yang Digunakan:**
  * **Image Picker**: Menggunakan package `image_picker` untuk mengambil foto langsung dari kamera atau memilih gambar dari galeri perangkat.
  * **Local Notifications**: Menggunakan package `flutter_local_notifications` untuk memicu notifikasi sistem segera setelah gambar berhasil diambil/dipilih.
  * **Hardware Integration**: Implementasi izin (permissions) untuk kamera dan notifikasi pada platform Android.
  * **Widget Detail**:
      * `Image.file`: Menampilkan file gambar yang dipilih dari penyimpanan lokal perangkat.
      * `ImagePicker`: Komponen utama untuk interaksi dengan sistem file media dan kamera.
      * `FlutterLocalNotificationsPlugin`: Mengelola inisialisasi dan pengiriman notifikasi ke *tray* sistem.
      * `StatefulWidget`: Menangani perubahan UI secara reaktif saat gambar baru dimuat.

  ### Screenshot Hasil
  <div align="center">
  <img src="/2311102050_Pertemuan08/preview1.png" width="24%" />
  <img src="/2311102050_Pertemuan08/preview2.png" width="24%" />
  <img src="/2311102050_Pertemuan08/preview3.png" width="24%" />
  <img src="/2311102050_Pertemuan08/preview4.png" width="24%" />
  </div>

  ---

  ## Praktikum Pertemuan 09-10
  Aplikasi Flutter sederhana yang mengimplementasikan **State Management Provider** dan **Firebase Cloud Messaging (FCM)**.

  **Fitur & Implementasi:**
  * **To-Do List & Provider**: Halaman daftar tugas sederhana yang menggunakan `Provider` untuk mengelola state data tugas secara reaktif.
  * **Manajemen State**: Penambahan tugas menggunakan fungsi `addTodo()` yang memanggil `notifyListeners()`, sehingga UI (`ListView`) langsung diperbarui tanpa me-reload aplikasi. Terdapat juga fitur menghapus seluruh tugas.
  * **Firebase Cloud Messaging (FCM)**: Integrasi dengan layanan push notification dari Firebase. Aplikasi mampu menerima notifikasi meskipun berada di *background*.
  * **FcmService**: Menangani izin notifikasi dan integrasi token perangkat agar notifikasi dari Firebase Console/Postman muncul pada *notification tray* Android.

  ### Dokumentasi Hasil
  Bisa dilihat pada laporan PDF yang disertakan: [Laporan.pdf](/2311102050_Pertemuan09-10/Laporan.pdf)

  ## Praktikum Pertemuan 11

Aplikasi Flutter sederhana yang mengimplementasikan **State Management BLoC/Cubit** untuk mengelola data keranjang belanja secara reaktif.

**Fitur & Implementasi:**

* **Daftar Produk & BLoC/Cubit**: Halaman utama menampilkan daftar produk elektronik Xiaomi yang terdiri dari minimal lima produk. Pengelolaan data keranjang menggunakan BLoC/Cubit agar state aplikasi dapat berubah secara reaktif.
* **Manajemen Keranjang**: Pengguna dapat menambahkan produk ke keranjang melalui tombol **Tambah**. Produk yang sudah masuk ke keranjang juga dapat dihapus melalui tombol ikon hapus pada halaman keranjang belanja.
* **Jumlah Item Real-Time**: Jumlah item pada keranjang ditampilkan dalam badge di ikon keranjang. Nilainya langsung berubah ketika produk ditambahkan atau dihapus tanpa perlu me-restart aplikasi.
* **BlocProvider & BlocBuilder**: `BlocProvider` digunakan untuk menyediakan `CartCubit` pada widget tree, sedangkan `BlocBuilder` digunakan untuk membangun ulang tampilan daftar keranjang dan badge jumlah item ketika state berubah.
* **Produk Xiaomi**: Produk yang ditampilkan meliputi Xiaomi 14T Pro, Xiaomi Redmi Note 13 Pro+, Xiaomi Pad 6, Xiaomi Smart Band 8, dan Xiaomi 33W Power Bank 10000mAh.

### Dokumentasi Hasil

Bisa dilihat pada laporan PDF yang disertakan: [Laporan.pdf](/2311102050_Pertemuan11/Laporan.pdf)


  <br>
  <p align="center">Made with ❤️ by <b>Galih Trisna</b><br>2311102050</p>

  