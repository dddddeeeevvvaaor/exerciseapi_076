import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:materi_flutterapi/model/kategori_barang_model.dart';

class Kategori_Barang_Controller {
  final String apiUrl = "http://localhost:8000/api/";

  Future<List<Kategori_Barang_Model>> getKategoriBarang() async {
    var result = await http.get(Uri.parse("${apiUrl}barang/getAllKB"));
    if (result.statusCode == 200) {
      return (jsonDecode(result.body) as List)
          .map((e) => Kategori_Barang_Model.fromMap(e))
          .toList();
    } else {
      throw Exception("Gagal mendapatkan data kategori barang");
    }
  }

  Future<bool> addKategoriBarang(Kategori_Barang_Model kategori_barang) async {
    var result = await http.post(Uri.parse("${apiUrl}barang/addKB"),
        body: jsonEncode(kategori_barang.toMap()),
        headers: {
          "Content-Type": "application/json"
        }); //berfungsi untuk mengirimkan data ke API
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal menambahkan data kategori barang");
    }
  }

  Future<bool> updateKategoriBarang(
      Kategori_Barang_Model kategori_barang) async {
    var result = await http.post(
        Uri.parse("${apiUrl}barang/updateKB/${kategori_barang.id}"),
        body: jsonEncode(kategori_barang.toMap()),
        headers: {"Content-Type": "application/json"});
    if (result.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal mengubah data kategori barang");
    }
  }
}
