import 'package:flutter/material.dart';
import 'splash_screen.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOKAS - Toko Barang Bekas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}

// Halaman utama setelah splash
class MovieHome extends StatelessWidget {
  const MovieHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda TOKAS"),
      ),
      body: Center(
        child: Text(
          "Selamat datang di TOKAS!\nToko Barang Bekas Berkualitas.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.blueGrey[800],
          ),
        ),
      ),
    );
  }
}
