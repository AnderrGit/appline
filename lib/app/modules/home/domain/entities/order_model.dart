class Order {
  final int id;
  final String itemCode;
  final String descripcionItem;
  final String codigoSocio;
  final String nombreSocio;
  final String usuario;
  final String fechaCreacion;
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
}
