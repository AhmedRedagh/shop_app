import 'package:json_annotation/json_annotation.dart';

import 'home_data_model.dart';

@JsonSerializable(explicitToJson: true)
class HomeModel {
  final bool? status;
  HomeDataModel? data;
  HomeModel({this.status, this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      data: HomeDataModel.fromjson(json['data']),
    );
  }
}
