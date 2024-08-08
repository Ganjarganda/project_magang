import 'package:flutter/material.dart';

class Informasi extends StatefulWidget {
  const Informasi({super.key});

  @override
  State<Informasi> createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  var informasiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jika ada suatu keinginan yang tidak berhasil engkau capai, maka ketahuilah bahwa Allah tahu jika hal tersebut tidak baik untukmu.',
              style: TextStyle(fontSize: 16.0), // Ukuran teks dapat disesuaikan
            ),
            SizedBox(height: 4.0), // Jarak antar baris teks
            Text(
              'Bisa jadi karena Allah tahu engkau tidak siap untuk menerimanya, atau karena engkau tak mampu menerimanya sekarang, atau ada hal yang lebih baik yang sedang menantimu didepan sana.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 4.0),
            Text(
              'Maka ridholah dengan ketetapan Allah dan tersenyumlah.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
