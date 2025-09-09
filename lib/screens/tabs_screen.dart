import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  String textFromFile = 'Vacio';
  // Variable para controlar que se muestre el texto al hacer clic en el boton
  bool showText = false;

  getDataDama() async {
    //Carga el archio de texto
    String response = await rootBundle.loadString('archivo_texto/dama.txt');
    setState(() {
      textFromFile = response;
      //Reemplaza el boton por el texto del archivo
      showText = true;
    });
  }

  getDataCaballero() async {
    //Carga el archio de texto
    String response = await rootBundle.loadString(
      'archivo_texto/caballero.txt',
    );
    setState(() {
      textFromFile = response;
      //Reemplaza el boton por el texto del archivo
      showText = true;
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/dama.jpg',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),

                  // Mostrar botón O texto según el estado
                  showText
                      ? SizedBox(
                          width: 150, // Mismo ancho que el botón
                          child: Text(
                            textFromFile,
                            style: const TextStyle(fontSize: 14),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            getDataDama();
                          },
                          child: const Text('Descripción'),
                        ),
                ],
              ),
            ),

            // Página 02 - CABALLERO
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

                  // Mostrar botón O texto según el estado
                  showText
                      ? SizedBox(
                          width: 150, // Mismo ancho que el botón
                          child: Text(
                            textFromFile,
                            style: const TextStyle(fontSize: 14),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            getDataCaballero();
                          },
                          child: const Text('Descripción'),
                        ),
                ],
              ),
            ),

            //Boton de regresar al inicio
          ],
        ),
      ),
    );
  }
}
