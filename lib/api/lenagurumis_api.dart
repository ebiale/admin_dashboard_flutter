import 'package:dio/dio.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/constants/system.dart';

class LGApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    _dio.options.baseUrl = API.baseUrl;

    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioException catch (e) {
      throw ('Something went wrong: ${e.response}');
    }
  }

  static put(String path, Map<String, dynamic> data) async {
    return await _sendData(data, path, 'PUT');
  }

  static post(String path, Map<String, dynamic> data) async {
    return await _sendData(data, path, 'POST');
  }

  static delete(String path) async {
    try {
      final resp = await _dio.delete(path);
      return resp.data;
    } on DioException catch (e) {
      throw ('Something went wrong: ${e.response}');
    }
  }

  static Future<dynamic> _sendData(
      Map<String, dynamic> data, String path, String method) async {
    final formData = FormData.fromMap(data);

    try {
      final Response resp;
      if (method == 'POST') {
        resp = await _dio.post(path, data: formData);
      } else if (method == 'PUT') {
        resp = await _dio.put(path, data: formData);
      } else {
        throw Exception('Method $method not supported');
      }

      return resp.data;
    } on DioException catch (e) {
      throw ('Something went wrong: ${e.response}');
    }
  }
}
