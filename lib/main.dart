import 'package:flutter/material.dart';
import 'inicio.dart';
import 'crear_mazo.dart';
import 'ver_mazos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Mazos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF252525), // Gris oscuro (Fondo)
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E), // Gris aún más oscuro (Barras)
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white, // Texto principal blanco
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
          iconTheme: IconThemeData(
              color: Color(0xFFFF6D00)), // Acentos naranja vibrante
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6D00), // Botones naranjas
            foregroundColor: Colors.white, // Texto en botones blancos
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF333333),
          hintStyle: const TextStyle(color: Colors.white54),
          labelStyle: const TextStyle(color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: Color(0xFFFF6D00), width: 2), // Borde naranja al enfocar
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Texto principal blanco
          bodyMedium: TextStyle(color: Colors.white), // Texto secundario blanco
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioScreen(),
        '/crear': (context) => const CrearMazoScreen(),
        '/ver': (context) => const VerMazosScreen(),
      },
    );
  }
}
