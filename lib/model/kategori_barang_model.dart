// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Kategori_Barang_Model {
  final int id;
  String nama;
  Kategori_Barang_Model({
    this.id = 0,
    this.nama = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_kategori_barang': id,
      'nama_kategori_barang': nama,
    };
  }

  factory Kategori_Barang_Model.fromMap(Map<String, dynamic> map) {
    return Kategori_Barang_Model(
      id: map['id_kategori_barang'],
      nama: map['nama_kategori_barang'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Kategori_Barang_Model.fromJson(String source) =>
      Kategori_Barang_Model.fromMap(json.decode(source));

  Kategori_Barang_Model copyWith({
    int? id,
    String? nama,
  }) {
    return Kategori_Barang_Model(
      id: id ?? this.id,
      nama: nama ?? this.nama,
    );
  }
}
