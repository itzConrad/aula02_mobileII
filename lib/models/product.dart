class Product {
  final String? id;
  final String name;
  final double price;
  final String description;
  final String imageUrl; // Novo campo exigido na atividade

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.description,
    this.imageUrl = 'https://via.placeholder.com/150', // Imagem padrão caso não tenha
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString(),
      name: json['name'],
      price: double.parse(json['price'].toString()),
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? 'https://via.placeholder.com/150',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}