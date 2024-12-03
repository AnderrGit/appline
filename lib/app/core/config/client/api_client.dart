import 'package:appline/app/core/config/client/api_interceptor.dart';
import 'package:dio/dio.dart';

class ApiClient with DioMixin implements Dio {
  ApiClient() {
    options = BaseOptions();
    httpClientAdapter = HttpClientAdapter();
    interceptors.add(ApiInterceptor());
  }
}
