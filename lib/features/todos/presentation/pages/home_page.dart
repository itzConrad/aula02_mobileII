import 'package:flutter/material.dart';
import 'product_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Bem-vindo à Loja',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navegação Simples
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductListPage()),
                );
              },
              child: const Text('Ver Produtos'),
            ),
          ],
        ),
      ),
    );
  }
}