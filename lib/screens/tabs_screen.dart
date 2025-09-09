import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  String textFromFile = 'Vacio';

  // Función para cargar datos del archivo
  Future<void> getDataDama() async {
    try {
      String response = await rootBundle.loadString('archivo_texto/dama.txt');
      setState(() {
        textFromFile = response;
      });
    } catch (e) {
      setState(() {
        textFromFile = 'Error al cargar el archivo: $e';
      });
    }
  }

  // Función para limpiar el texto
  void clearDama() {
    setState(() {
      textFromFile = 'Vacio';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tienda de Calzados',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 30, 0, 35),
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.face_3), text: 'DAMA'),
              Tab(icon: Icon(Icons.face_5), text: 'CABALLERO'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Página 01 - DAMA
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/dama.jpg',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: getDataDama,
                    child: const Text('Descripción'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: clearDama,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Limpiar'),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      textFromFile,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            // Página 02 - CABALLERO
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.face_5, size: 80, color: Colors.blue),
                  const SizedBox(height: 16),
                  const Text(
                    'Calzados para Caballero',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('Estilos: Formales, Casuales, Deportivos'),
                  const SizedBox(height: 8),
                  const Text('Talles: 38 al 45'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Puedes agregar funcionalidad similar para caballero
                    },
                    child: const Text('Ver Catálogo'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
