import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Aquí puedes agregar headers personalizados o lógica pre-request
    options.headers.addAll({
      'accept': 'application/json',
    });
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(dio.Response<dynamic> response,
      ResponseInterceptorHandler handler) async {
    // Aquí puedes agregar lógica para depurar o modificar la respuesta
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // Manejamos los errores globales
    String errorMessage = _handleError(err);

    // Mostramos un Snackbar con GetX
    Get.snackbar(
      'Error',
      errorMessage,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      backgroundColor: const Color(0xFFB00020), // Rojo para indicar error
      colorText: const Color(0xFFFFFFFF),
    );

    return super.onError(err, handler);
  }

  String _handleError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
      return 'Tiempo de conexión agotado. Por favor, verifica tu conexión a Internet.';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return 'El servidor tardó demasiado en responder.';
    } else if (error.type == DioExceptionType.badResponse) {
      if (error.response?.statusCode == 404) {
        return 'Recurso no encontrado (404).';
      } else if (error.response?.statusCode == 500) {
        return 'Error interno del servidor (500).';
      } else {
        return 'Error inesperado del servidor: ${error.response?.statusMessage}';
      }
    } else if (error.type == DioExceptionType.cancel) {
      return 'Solicitud cancelada.';
    } else {
      return 'Error desconocido: ${error.message}';
    }
  }
}
