import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // Variables separadas para cada pestaña
  String textDama = 'Vacio';
  String textCaballero = 'Vacio';
  bool showTextDama = false;
  bool showTextCaballero = false;

  getDataDama() async {
    try {
      String response = await rootBundle.loadString('archivo_texto/dama.txt');
      setState(() {
        textDama = response;
        showTextDama = true;
      });
    } catch (e) {
      setState(() {
        textDama = 'Error al cargar archivo';
        showTextDama = true;
      });
    }
  }

  getDataCaballero() async {
    try {
      String response = await rootBundle.loadString(
        'archivo_texto/caballero.txt',
      );
      setState(() {
        textCaballero = response;
        showTextCaballero = true;
      });
    } catch (e) {
      setState(() {
        textCaballero = 'Error al cargar archivo';
        showTextCaballero = true;
      });
    }
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
            Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/dama.jpg',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20),
                      // Mostrar botón O texto para DAMA
                      showTextDama
                          ? SizedBox(
                              width: 150,
                              child: Text(
                                textDama,
                                style: const TextStyle(fontSize: 14),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: getDataDama,
                              child: const Text('Descripción'),
                            ),
                    ],
                  ),
                ),
                // Botón de volver en posición fija
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Volver al Inicio'),
                  ),
                ),
              ],
            ),

            // Página 02 - CABALLERO
            Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/caballero.jpg',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20),
                      // Mostrar botón O texto para CABALLERO
                      showTextCaballero
                          ? SizedBox(
                              width: 150,
                              child: Text(
                                textCaballero,
                                style: const TextStyle(fontSize: 14),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: getDataCaballero,
                              child: const Text('Descripción'),
                            ),
                    ],
                  ),
                ),
                // Botón de volver en posición fija
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Volver al Inicio'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
