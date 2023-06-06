class BannerModel {
  int? id;
  dynamic image, category, product;

  BannerModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }
}
