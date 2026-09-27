import 'package:flutter/material.dart';
import 'mahasiswa.dart';
import 'utils/button/button_primary.dart';
import 'utils/font/text_google.dart';

class Detail extends StatelessWidget {
  final Mahasiswa mahasiswa;

  const Detail({
    super.key,
    required this.mahasiswa,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextGoogle(
          'Detail Mahasiswa',
          font: 'russo',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextGoogle(
              'Data Mahasiswa',
              font: 'russo',
            ),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextGoogle(
                      'Informasi Mahasiswa',
                      font: 'fredoka',
                    ),

                    const SizedBox(height: 20),

                    TextGoogle(
                      'NIM: ${mahasiswa.nim}',
                    ),

                    const SizedBox(height: 12),

                    TextGoogle(
                      'Nama: ${mahasiswa.nama}',
                    ),

                    const SizedBox(height: 12),

                    TextGoogle(
                      'Alamat: ${mahasiswa.alamat}',
                    ),

                    const SizedBox(height: 12),

                    TextGoogle(
                      'Email: ${mahasiswa.email}',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ButtonPrimary(
                text: 'Kembali ke Menu Utama',
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}