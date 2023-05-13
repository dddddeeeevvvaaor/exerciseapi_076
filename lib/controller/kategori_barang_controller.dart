import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:materi_flutterapi/model/kategori_barang_model.dart';

class Kategori_Barang_Controller {
  final String apiUrl = "http://localhost:8000/api/";

  Future<List<Kategori_Barang_Model>> getKategoriBarang() async {
    var result = await http.get(Uri.parse("${apiUrl}barang/getAllKB"));
    if (result.statusCode == 200) {
      var data = json.decode(result.body);
      List<Kategori_Barang_Model> kategori_barang = [];
      for (var i in data) {
        Kategori_Barang_Model kategori = Kategori_Barang_Model.fromMap(i);
        kategori_barang.add(kategori);
      }
      return kategori_barang;
    } else {
      throw Exception("Gagal mengambil data kategori barang");
    }
  }

  Future addKategoriBarang(Kategori_Barang_Model kategori) async {
    var result = await http.post(Uri.parse("${apiUrl}barang/addKB"), body: {
      "name_kategori_barang": kategori.nama,
    });
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      throw Exception("Gagal menambahkan data kategori barang");
    }
  }
}
