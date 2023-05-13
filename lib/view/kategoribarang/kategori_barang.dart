import 'package:flutter/material.dart';
import 'package:materi_flutterapi/controller/kategori_barang_controller.dart';
import 'package:materi_flutterapi/model/kategori_barang_model.dart';
import 'package:materi_flutterapi/view/kategoribarang/add_kategori_barang.dart';


class Kategori_Barang extends StatefulWidget {
  const Kategori_Barang({super.key});

  @override
  State<Kategori_Barang> createState() => _Kategori_BarangState();
}

class _Kategori_BarangState extends State<Kategori_Barang> {
  final kategori_barang_controller = Kategori_Barang_Controller();
  List<Kategori_Barang_Model> listKategoriBarang = [];

  @override
  void initState() {
    super.initState();
    getKategoriBarang();
  }

  void getKategoriBarang() async {
    final kategori_barang = await kategori_barang_controller.getKategoriBarang();
    setState(() {
      listKategoriBarang = kategori_barang;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategori Barang"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: listKategoriBarang.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(listKategoriBarang[index].nama),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
              ),
            );
          },
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context) => const Add_Kategori_Barang(),));
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}