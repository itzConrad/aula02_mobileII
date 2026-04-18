import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/product_viewmodel.dart';
// Importe a tela de formulário
import 'product_form_screen.dart'; 

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductViewModel>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produtos (MVVM)')),
      body: Consumer<ProductViewModel>(
        builder: (context, viewModel, child) {
          switch (viewModel.state) {
            case AppState.loading:
              return const Center(child: CircularProgressIndicator());
            
            case AppState.error:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 60),
                    const SizedBox(height: 16),
                    Text(viewModel.errorMessage, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => viewModel.fetchProducts(),
                      child: const Text('Tentar Novamente'),
                    ),
                  ],
                ),
              );

            case AppState.success:
              if (viewModel.products.isEmpty) {
                 return const Center(child: Text('Nenhum produto encontrado.'));
              }
              return ListView.builder(
                itemCount: viewModel.products.length,
                itemBuilder: (context, index) {
                  final product = viewModel.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
                    // Opcional: Você pode recolocar o botão de editar e excluir aqui depois
                  );
                },
              );
          }
        },
      ),
      // Aqui está o botão de adicionar restaurado!
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProductFormScreen()),
          );
        },
      ),
    );
  }
}