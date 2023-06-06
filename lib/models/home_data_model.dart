import 'package:shop_app/models/banners_model.dart';
import 'package:shop_app/models/products_model.dart';

class HomeDataModel {
  List<BannerModel> banners = [];
  List<ProductsModel> products = [];
  HomeDataModel();
  HomeDataModel.fromjson(Map<String, dynamic> json) {
    banners = (json['banners'] as List)
        .map((element) => BannerModel.fromjson(element))
        .toList();
    products = (json['products'] as List)
        .map((element) => ProductsModel.fromjson(element))
        .toList();
  }
}
