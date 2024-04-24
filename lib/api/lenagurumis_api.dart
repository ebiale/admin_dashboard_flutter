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
      throw ('Something went wrong: $e');
    }
  }

  static put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Something went wrong: $e');
    }
  }

  static post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Something went wrong: $e');
    }
  }

  static delete(String path) async {
    try {
      final resp = await _dio.delete(path);
      return resp.data;
    } catch (e) {
      throw ('Something went wrong: $e');
    }
  }
}
