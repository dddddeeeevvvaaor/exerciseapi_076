import 'package:flutter/material.dart';
import 'package:materi_flutterapi/controller/kategori_barang_controller.dart';
import 'package:materi_flutterapi/model/kategori_barang_model.dart';
import 'package:materi_flutterapi/view/kategoribarang/add_kategori_barang.dart';

import 'update_kategori_barang.dart';

class Kategori_Barang extends StatefulWidget {
  const Kategori_Barang({super.key});

  @override
  State<Kategori_Barang> createState() => _Kategori_BarangState();
}

class _Kategori_BarangState extends State<Kategori_Barang> {
  late Kategori_Barang_Controller _kategori_barang_controller;

@override
  void initState() {
    super.initState();
    _kategori_barang_controller = Kategori_Barang_Controller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Barang'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Add_Kategori_Barang(
                    kategori_barang_model: Kategori_Barang_Model(),
                    saveChanges: _kategori_barang_controller.addKategoriBarang,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Kategori_Barang_Model>>(
        future: _kategori_barang_controller.getKategoriBarang(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return ListTile(
                  title: Text(item.nama!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Update_Kategori_Barang(
                                kategori_barang_model: item,
                                saveChanges: _kategori_barang_controller
                                    .updateKategoriBarang,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Peringatan'),
                                content: const Text(
                                    'Apakah anda yakin ingin menghapus data ini?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Tidak'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _kategori_barang_controller
                                          .deleteKategoriBarang(item.id!);
                                      Navigator.pop(context);
                                      setState(() {});
                                      var snackBar = SnackBar(
                                          content: Text(
                                              'Data ${item.nama} berhasil dihapus'),
                                          duration: const Duration(seconds: 1),
                                          backgroundColor: Colors.red);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    child: const Text('Ya'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}