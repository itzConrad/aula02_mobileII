import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Note o import correto do viewmodel que está na pasta ao lado
import '../viewmodels/product_viewmodel.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        backgroundColor: Colors.blueAccent,
        actions: [
          Consumer<ProductViewModel>(
            builder: (context, vm, _) => Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  'Favoritos: ${vm.favoriteCount}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, vm, child) {
          return ListView.builder(
            itemCount: vm.products.length,
            itemBuilder: (context, index) {
              final product = vm.products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: Icon(
                    product.favorite ? Icons.star : Icons.star_border,
                    color: product.favorite ? Colors.amber : null,
                  ),
                  onPressed: () => vm.toggleFavorite(product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}