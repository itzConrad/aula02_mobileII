import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importação nova
import 'controllers/product_controller.dart'; // Importação nova
import 'screens/home_screen.dart';

void main() {
  runApp(
    // Envolvemos o App com o ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => ProductController(),
      child: const MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Produtos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}