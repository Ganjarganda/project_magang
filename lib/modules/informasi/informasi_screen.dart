import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/utils/constant.dart';

class InformasiScreen extends StatefulWidget {
  const InformasiScreen({super.key});

  @override
  State<InformasiScreen> createState() => _InformasiScreenState();
}

class _InformasiScreenState extends State<InformasiScreen> {
  var informasiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Informasi',
          style: styleTitle,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textSimple(
            message:
                'Jika ada suatu keinginan yang tidak berhasil engkau capai, maka ketahuilah bahwa Allah tahu jika hal tersebut tidak baik untukmu.',
          ),
          SizedBox(height: setHeight(30)),
          textSimple(
            message:
                'Bisa jadi karena Allah tahu engkau tidak siap untuk menerimanya, atau karena engkau tak mampu menerimanya sekarang, atau ada hal yang lebih baik yang sedang menantimu didepan sana.',
          ),
          SizedBox(height: setHeight(30)),
          textSimple(
            message: 'Maka ridholah dengan ketetapan Allah dan tersenyumlah.',
          ),
        ],
      ),
    );
  }

  Widget textSimple({required String message}) {
    return Text(
      message,
      style: styleSubtitle,
      textAlign: TextAlign.justify,
    );
  }
}
