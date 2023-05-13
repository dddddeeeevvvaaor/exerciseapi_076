import 'package:flutter/material.dart';
import 'package:materi_flutterapi/model/kategori_barang_model.dart';
import 'package:materi_flutterapi/view/kategoribarang/kategori_barang.dart';

import '../../controller/kategori_barang_controller.dart';

class Update_Kategori_Barang extends StatefulWidget {
  final Kategori_Barang_Model kategori_barang_model;
  final Function saveChanges;

  const Update_Kategori_Barang({
    Key? key,
    required this.kategori_barang_model,
    required this.saveChanges,
  }) : super(key: key);

  @override
  State<Update_Kategori_Barang> createState() => _Update_Kategori_BarangState();
}

class _Update_Kategori_BarangState extends State<Update_Kategori_Barang> {
  late Kategori_Barang_Controller _kategori_barang_controller;
  Future<List<Kategori_Barang_Model>>? _kategori_barang_model;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Kategori Barang'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: TextEditingController(
                  text: widget.kategori_barang_model.nama),
              decoration: InputDecoration(
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
            SizedBox(
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
                      builder: (context) => Kategori_Barang(),
                    ),
                  );
                  var snackBar = SnackBar(
                    content: Text('Data ${widget.kategori_barang_model.nama} berhasil diupdate'),
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.yellow,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}