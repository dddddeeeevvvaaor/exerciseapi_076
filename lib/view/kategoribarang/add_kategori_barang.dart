import 'package:flutter/material.dart';
import 'package:materi_flutterapi/controller/kategori_barang_controller.dart';
import 'package:materi_flutterapi/model/kategori_barang_model.dart';

class Add_Kategori_Barang extends StatefulWidget {
  const Add_Kategori_Barang({super.key});

  @override
  State<Add_Kategori_Barang> createState() => _Add_Kategori_BarangState();
}

class _Add_Kategori_BarangState extends State<Add_Kategori_Barang> {
  final kategori_barang_controller = Kategori_Barang_Controller();
  String? nama;

  void addKategoriBarang() async {
    final kategori_barang = await kategori_barang_controller
        .addKategoriBarang(Kategori_Barang_Model(nama: nama!));
  }

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kategori Barang'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nama Kategori Barang',
                labelText: 'Nama Kategori Barang',
              ),
              onChanged: (value) {
                nama = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  addKategoriBarang();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Add_Kategori_Barang()));
                  var snackBar =
                      const SnackBar(content: Text('Data Berhasil Disimpan'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
