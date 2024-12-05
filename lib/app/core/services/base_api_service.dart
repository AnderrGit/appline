import 'package:dio/dio.dart';

abstract class BaseApiService {
  final Dio _apiClient;

  BaseApiService(this._apiClient);

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  }) async {
    try {
      final response = await _apiClient.get(
        path,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 'success') {
          return fromJson(data['data']);
        } else {
          throw Exception('API Error: ${data['message'] ?? 'Unknown error'}');
        }
      } else {
        throw Exception('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Connection Error: $e');
    }
  }

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? data,
    required T Function(dynamic data) fromJson,
  }) async {
    try {
      final response = await _apiClient.post(path, data: data);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData['status'] == 'success') {
          return fromJson(responseData['data']);
        } else {
          throw Exception('API Error: ${responseData['message']}');
        }
      } else {
        throw Exception('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Connection Error: $e');
    }
  }
}
