import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamera & Notifikasi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  late FlutterLocalNotificationsPlugin _localNotifications;

  @override
  void initState() {
    super.initState();
    _initNotification();
  }

  // 1. Inisialisasi Fitur Notifikasi Lokal
  void _initNotification() async {
    _localNotifications = FlutterLocalNotificationsPlugin();

    // Konfigurasi Android
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _localNotifications.initialize(initializationSettings);

    // Minta izin notifikasi khusus Android 13+
    _localNotifications
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  // 2. Fungsi untuk Memicu Notifikasi
  Future<void> _showNotification(String source) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id_camera',
      'Media Media Channel',
      channelDescription: 'Notifikasi saat foto berhasil diambil atau dipilih',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotifications.show(
      0,
      'Berhasil Memuat Gambar! 📸',
      'Foto berhasil didapatkan melalui $source.',
      platformDetails,
    );
  }

  // 3. Fungsi Ambil Foto (Kamera / Galeri)
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80, // Optimasi ukuran gambar
      );

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });

        // Pemicu notifikasi setelah foto berhasil dimuat
        String sourceText = source == ImageSource.camera ? 'Kamera' : 'Galeri';
        _showNotification(sourceText);
      }
    } catch (e) {
      debugPrint("Error mengambil gambar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi & Hardware API'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder/Tampilan Gambar
            Expanded(
              child: Center(
                child: _imageFile != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    _imageFile!,
                    fit: BoxFit.cover,
                  ),
                )
                    : Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 80, color: Colors.grey),
                      SizedBox(height: 10),
                      Text(
                        'Belum ada foto yang dipilih',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Aksi Kamera
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: const Icon(Icons.camera_alt),
              label: const Text('Buka Kamera Langsung'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            // Tombol Aksi Galeri
            OutlinedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: const Icon(Icons.photo_library),
              label: const Text('Pilih dari Galeri'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Colors.blueAccent),
                foregroundColor: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}