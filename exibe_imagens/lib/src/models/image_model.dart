class ImageModel{
  late String url;
  late String alt;

  ImageModel(this.url, this.alt);

  ImageModel.fromJSON (Map <String, dynamic> mapa){
    url =  mapa ['photos'][0]['src']['small']; // por ser um mapa temos que pegar com ['']
    alt = mapa['photos'][0]['alt'];
  }

  @override
  String toString(){
    return'url': $url, alt: $alt; // $ = interpolação
  }
}