import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/product_viewmodel.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nossos Produtos')),
      body: Consumer<ProductViewModel>(
        builder: (context, vm, child) {
          return ListView.builder(
            itemCount: vm.products.length,
            itemBuilder: (context, index) {
              final product = vm.products[index];
              return ListTile(
                leading: Image.network(product.imageUrl, width: 50, errorBuilder: (_, __, ___) => const Icon(Icons.image)),
                title: Text(product.name),
                subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
                onTap: () {
                  // Envia o objeto 'product' para a próxima tela
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}