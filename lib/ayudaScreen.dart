import 'package:flutter/material.dart';
import 'reportarErrorScreen.dart';

class AyudaScreen extends StatelessWidget {
  const AyudaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayuda'),
      ),
      body: Container(
        color: Colors.white, // Fondo de color claro
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '¡No te pierdas ni un detalle de tu equipo favorito!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '¿Qué es la app?\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Text(
                'Es una aplicación móvil que te permite estar al día con toda la información de los jugadores y el director técnico de tu equipo favorito.\n',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const Text(
                '¿Qué puedo hacer con la app?\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Text(
                'Consultar el plantel del equipo: Conoce la lista completa de jugadores del equipo y sus posiciones, así como el director técnico.\n'
                'Ver detalles de jugadores: Accede a información detallada sobre cada jugador, como edad, lugar de nacimiento, etc.\n',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const Text(
                '¿Cómo funciona la app?\n',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Text(
                'Selecciona tu equipo favorito: Una vez dentro de la aplicación, elige el equipo que quieres seguir.\n'
                'Consulta el plantel: Accede a la sección de plantel para ver la lista de jugadores y el director técnico.\n'
                'Ver detalles: Haz clic en "Ver más" junto al nombre de cada jugador para ver su información detallada.\n',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReportarErrorScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.redAccent),
                  padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 16.0)),
                ),
                child: const Text('¿Tienes un error?',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
