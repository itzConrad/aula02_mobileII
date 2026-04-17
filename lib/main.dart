import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Mude a importação para a Home

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Produtos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), // Ponto de entrada alterado!
      debugShowCheckedModeBanner: false,
    );
  }
}