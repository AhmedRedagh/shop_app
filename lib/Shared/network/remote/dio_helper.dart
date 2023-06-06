import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      }));

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query, String? token}) async {
    dio.options.headers = {'Authorization': token};
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required data,
      lang,
      token}) async {
    dio.options.headers = {
      'lang': lang,
      'autorization': token,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: jsonEncode(data),
    );
  }
}
