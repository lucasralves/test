import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:servertest/app/modules/stock/repository/stock_repository.dart';
import 'package:servertest/app/server/constant.dart';

class StockRepositoryImplementation implements StockRepository {

  Dio dio;

  StockRepositoryImplementation() {
    dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
  
  @override
  Future<String> getMainCategories() async {
    try {
      return (await dio.get('$IP/stock/categories/?main=True')).data.toString();
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> getCategoryContent({String id}) async {
    try {
      return (await dio.get('$IP/stock/categories/?id=$id}')).data.toString();
    } catch (e) {
    return e.toString();
    }
  }

  @override
  Future<String> addNewCategory({String name, bool main, String idParent}) async {
    try {
      return (await dio.post(
        '$IP/stock/categories/',
        data: {
          "name": name,
          "main": main,
          "id_parent": idParent,
        },
      )).data.toString();
    } catch (e) {
    return e.toString();
    }
  }

  @override
  Future<String> editCategoryName({String name, String idParent, String id}) async {
    try {
      return (await dio.put(
      '$IP/stock/categories/$id/',
      data: {
      "name": name,
      "id_parent": idParent,
      },
      )).data.toString();
    } catch (e) {
    return e.toString();
    }
  }

  @override
  Future<String> deleteCategory({String id}) async {
    try {
      await dio.delete('$IP/stock/categories/$id/');
      return 'Success';
    } catch (e) {
      return e.toString();
    }
  }

}