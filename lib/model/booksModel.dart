class Books {
  bool status;
  List<Sonuc> sonuc;

  Books({this.status, this.sonuc});

  Books.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sonuc'] != null) {
      sonuc = new List<Sonuc>();
      json['sonuc'].forEach((v) {
        sonuc.add(new Sonuc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.sonuc != null) {
      data['sonuc'] = this.sonuc.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sonuc {
  int id;
  String baslik;
  String yazar;
  String yayinevi;
  String isbn;
  String resim;

  Sonuc(
      {this.id, this.baslik, this.yazar, this.yayinevi, this.isbn, this.resim});

  Sonuc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    baslik = json['baslik'];
    yazar = json['yazar'];
    yayinevi = json['yayinevi'];
    isbn = json['isbn'];
    resim = json['resim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['baslik'] = this.baslik;
    data['yazar'] = this.yazar;
    data['yayinevi'] = this.yayinevi;
    data['isbn'] = this.isbn;
    data['resim'] = this.resim;
    return data;
  }
}