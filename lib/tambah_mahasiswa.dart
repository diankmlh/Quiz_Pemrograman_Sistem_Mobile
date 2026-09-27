import 'package:flutter/material.dart';
import 'mahasiswa.dart';
import 'utils/button/button_primary.dart';
import 'utils/font/text_google.dart';

class TambahMahasiswa extends StatefulWidget {
  const TambahMahasiswa({super.key});

  @override
  State<TambahMahasiswa> createState() => _TambahMahasiswaState();
}

class _TambahMahasiswaState extends State<TambahMahasiswa> {
  final TextEditingController nimController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextGoogle(
          'Tambah Mahasiswa',
          font: 'russo',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextGoogle(
              'Tambah Data Mahasiswa',
              font: 'russo',
            ),

            const SizedBox(height: 8),

            const TextGoogle(
              'Masukkan data mahasiswa pada form berikut.',
            ),

            const SizedBox(height: 24),

            TextField(
              controller: nimController,
              decoration: const InputDecoration(
                labelText: 'NIM',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ButtonPrimary(
                text: 'Simpan Data',
                onPressed: () {
                  final mahasiswa = Mahasiswa(
                    nim: nimController.text,
                    nama: namaController.text,
                    alamat: alamatController.text,
                    email: emailController.text,
                  );

                  Navigator.pop(context, mahasiswa);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}