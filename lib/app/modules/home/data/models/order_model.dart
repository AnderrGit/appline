import 'package:appline/app/modules/home/domain/entities/order_model.dart';

class OrderModel {
  final int id;
  final String itemCode;
  final String descripcionItem;
  final String codigoSocio;
  final String nombreSocio;
  final String usuario;
  final String fechaCreacion;
  final String estado;
  final double precio;

  OrderModel({
    required this.id,
    required this.itemCode,
    required this.descripcionItem,
    required this.codigoSocio,
    required this.nombreSocio,
    required this.usuario,
    required this.fechaCreacion,
    required this.estado,
    required this.precio,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      itemCode: json['itemCode'],
      descripcionItem: json['descripcionItem'],
      codigoSocio: json['codigoSocio'],
      nombreSocio: json['nombreSocio'],
      usuario: json['usuario'],
      fechaCreacion: json['fechaCreacion'],
      estado: json['estado'],
      precio: json['precio'].toDouble(),
    );
  }

  Order toDomain() {
    return Order(
      id: id,
      itemCode: itemCode,
      descripcionItem: descripcionItem,
      codigoSocio: codigoSocio,
      nombreSocio: nombreSocio,
      usuario: usuario,
      fechaCreacion: fechaCreacion,
      estado: estado,
      precio: precio,
    );
  }
}
