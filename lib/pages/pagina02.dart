import 'package:flutter/material.dart';
//Importar pantalla del los tabs
import 'package:catalogo_examen/screens/tabs_screen.dart';

class Pagina02 extends StatelessWidget {
  const Pagina02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'tabs',
      routes: {'tabs': (context) => const TabsScreen()},
    );
  }
}
