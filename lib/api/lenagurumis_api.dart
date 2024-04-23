// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import 'package:admin_dashboard/services/local_storage.dart';

class LGApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //Base url

    _dio.options.baseUrl = 'http://localhost:8080/api';

    // headers

    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } catch (e) {
      print(e);
      throw ('Something went wrong getting the request');
    }
  }

  static post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Something went wrong posting the request');
    }
  }
}
