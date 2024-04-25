import 'dart:typed_data';

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
    final formData = FormData.fromMap(data);
    return await _sendData(formData, path, 'PUT');
  }

  static post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    return await _sendData(formData, path, 'POST');
  }

  static uploadFile(String path, Uint8List bytes) async {
    final formData =
        FormData.fromMap({'archivo': MultipartFile.fromBytes(bytes)});

    return await _sendData(formData, path, 'PUT');
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
      FormData data, String path, String method) async {
    try {
      final Response resp;
      if (method == 'POST') {
        resp = await _dio.post(path, data: data);
      } else if (method == 'PUT') {
        resp = await _dio.put(path, data: data);
      } else {
        throw Exception('Method $method not supported');
      }

      return resp.data;
    } on DioException catch (e) {
      throw ('Something went wrong: ${e.response}');
    }
  }
}
