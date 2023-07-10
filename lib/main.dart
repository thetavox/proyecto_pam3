import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_pam/pages/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF3F7AFE),),
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => Home(),
        "/principal": (context) => Principal(),
        "/registrar": (context) => Registrar(),
        "/ayuda": (context) => Ayuda(),
        "/direccion": (context) => Direccion(),
        "/idioma": (context) => Idioma(),
        "/pedidos": (context) => Pedidos(),
        "/perfil": (context) => Perfil(),
        "/pago": (context) => Pago(),
      },
    );
  }
}
