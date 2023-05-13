import 'package:flutter/material.dart';
import 'package:materi_flutterapi/controller/kategori_barang_controller.dart';
import 'package:materi_flutterapi/model/kategori_barang_model.dart';
import 'package:materi_flutterapi/view/kategoribarang/kategori_barang.dart';

class Add_Kategori_Barang extends StatefulWidget {
    final Kategori_Barang_Model kategori_barang_model;
  final Function saveChanges;

  const Add_Kategori_Barang({
    Key? key,
    required this.kategori_barang_model,
    required this.saveChanges,
  }) : super(key: key);

  @override
  State<Add_Kategori_Barang> createState() => _Add_Kategori_BarangState();
}

class _Add_Kategori_BarangState extends State<Add_Kategori_Barang> {
  late Kategori_Barang_Controller _kategori_barang_controller;
  Future<List<Kategori_Barang_Model>>? _kategori_barang_model;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _kategori_barang_controller = Kategori_Barang_Controller();
    _kategori_barang_model = _kategori_barang_controller.getKategoriBarang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Kategori Barang'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: TextEditingController(
                  text: widget.kategori_barang_model.nama),
              decoration: const InputDecoration(
                labelText: 'Nama Kategori Barang',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori Barang tidak boleh kosong';
                }
                return null;
              },
              onSaved: (value) {
                widget.kategori_barang_model.nama = value!;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await widget.saveChanges(widget.kategori_barang_model);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Kategori_Barang(),
                    ),
                  );
                  var snackBar = SnackBar(
                    content: Text(
                        'Data ${widget.kategori_barang_model.nama} berhasil ditambahkan'),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.green,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
