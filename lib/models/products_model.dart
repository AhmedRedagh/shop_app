import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class ProductsModel {
  int? id;
  dynamic price, oldPrice, discount, image, name, description;

  bool? inFavorites;
  bool? inCart;
  ProductsModel(
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.description,
    this.inFavorites,
    this.inCart,
    this.name,
  );
  ProductsModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    name = json['name'];
  }
}
