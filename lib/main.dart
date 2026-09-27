import 'package:flutter/material.dart';
import 'mahasiswa.dart';
import 'tambah_mahasiswa.dart';
import 'detail.dart';
import 'utils/font/text_google.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Mahasiswa> daftarMahasiswa = [];

  void tambahMahasiswa(Mahasiswa mahasiswa) {
    setState(() {
      daftarMahasiswa.add(mahasiswa);
    });
  }

  Future<void> bukaFormTambahMahasiswa() async {
    final mahasiswa = await Navigator.push<Mahasiswa>(
      context,
      MaterialPageRoute(
        builder: (context) => const TambahMahasiswa(),
      ),
    );

    if (mahasiswa != null) {
      tambahMahasiswa(mahasiswa);

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Detail(
            mahasiswa: mahasiswa,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextGoogle(
          'Data Mahasiswa',
          font: 'russo',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const TextGoogle(
              'Selamat Datang',
              font: 'russo',
            ),

            const SizedBox(height: 10),

            const TextGoogle(
              'Kelola data mahasiswa dengan mudah.',
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(
                  Icons.person_add,
                  size: 36,
                ),
                title: const TextGoogle(
                  'Tambah Mahasiswa',
                  font: 'fredoka',
                ),
                subtitle: const TextGoogle(
                  'Masukkan data mahasiswa baru',
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: bukaFormTambahMahasiswa,
              ),
            ),

            const SizedBox(height: 16),

            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(
                  Icons.people,
                  size: 36,
                ),
                title: const TextGoogle(
                  'Data Mahasiswa',
                  font: 'fredoka',
                ),
                subtitle: TextGoogle(
                  '${daftarMahasiswa.length} mahasiswa tersimpan',
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      if (daftarMahasiswa.isEmpty) {
                        return const SizedBox(
                          height: 200,
                          child: Center(
                            child: TextGoogle(
                              'Belum ada data mahasiswa.',
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: daftarMahasiswa.length,
                        itemBuilder: (context, index) {
                          final mahasiswa = daftarMahasiswa[index];

                          return ListTile(
                            leading: const Icon(
                              Icons.person,
                            ),
                            title: TextGoogle(
                              mahasiswa.nama,
                              font: 'fredoka',
                            ),
                            subtitle: TextGoogle(
                              mahasiswa.nim,
                            ),
                            onTap: () {
                              Navigator.pop(context);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detail(
                                    mahasiswa: mahasiswa,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
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