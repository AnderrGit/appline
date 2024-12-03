class Order {
  final int id;
  final String itemCode;
  final String descripcionItem;
  final String codigoSocio;
  final String nombreSocio;
  final String usuario;
  final DateTime fechaCreacion;
  final String estado;
  final double precio;

  Order({
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

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      itemCode: json['itemCode'],
      descripcionItem: json['descripcionItem'],
      codigoSocio: json['codigoSocio'],
      nombreSocio: json['nombreSocio'],
      usuario: json['usuario'],
      fechaCreacion: DateTime.parse(json['fechaCreacion']),
      estado: json['estado'],
      precio: json['precio'].toDouble(),
    );
  }
}
