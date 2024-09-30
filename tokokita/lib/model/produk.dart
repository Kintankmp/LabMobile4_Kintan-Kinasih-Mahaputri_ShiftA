class Produk {
  int? id;
  String? kodeProduk;
  String? namaProduk;
  int? hargaProduk;

  Produk({this.id, this.kodeProduk, this.namaProduk, this.hargaProduk});

  factory Produk.fromJson(Map<String, dynamic> obj) {
    return Produk(
      id: obj['id'] as int?, // Pastikan untuk melakukan cast jika perlu
      kodeProduk: obj['kode_produk'] as String?,
      namaProduk: obj['nama_produk'] as String?,
      hargaProduk: obj['harga'] as int?, // Pastikan ini sesuai tipe data
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode_produk': kodeProduk,
      'nama_produk': namaProduk,
      'harga': hargaProduk,
    };
  }
}