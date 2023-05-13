// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Kategori_Barang_Model {
  final String nama;
  Kategori_Barang_Model({
    required this.nama,
  });

  Kategori_Barang_Model copyWith({
    String? nama,
  }) {
    return Kategori_Barang_Model(
      nama: nama ?? this.nama,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama_kategori_barang': nama,
    };
  }

  factory Kategori_Barang_Model.fromMap(Map<String, dynamic> map) {
    return Kategori_Barang_Model(
      nama: map['nama_kategori_barang'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kategori_Barang_Model.fromJson(String source) => Kategori_Barang_Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Kategori_Barang_Model(nama: $nama)';

  @override
  bool operator ==(covariant Kategori_Barang_Model other) {
    if (identical(this, other)) return true;
  
    return 
      other.nama == nama;
  }

  @override
  int get hashCode => nama.hashCode;
}