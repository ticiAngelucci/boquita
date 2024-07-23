import 'package:flutter/material.dart';

class QuienesSomosScreen extends StatelessWidget {
  const QuienesSomosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiénes somos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'San Juniors es un equipo apasionado por el deporte y la tecnología los cuales han creado esta aplicación para que los fanáticos del fútbol no se pierdan ni un solo partido de su equipo favorito.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nuestra misión:\n',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Es acercar a los fanáticos del fútbol a sus equipos favoritos a través de una aplicación móvil simple, intuitiva y completa. Queremos que nuestros usuarios tengan acceso a toda la información que necesitan para estar al día con los equipos.\n',
              style: TextStyle(fontSize: 14),
            ),
            const Text(
              'Nuestros valores:\n',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Pasión: Amamos el fútbol y queremos compartir esa pasión con nuestros usuarios.\n\n'
              'Compromiso: Nos comprometemos a brindar una experiencia de usuario eficiente y de alta calidad.\n\n'
              'Innovación: Estamos constantemente buscando nuevas formas de mejorar nuestra aplicación y ofrecer nuevas funciones a nuestros usuarios.\n\n'
              'Feedback: Nuestro compromiso con la experiencia de usuario es una prioridad, por lo tanto desarrollamos un apartado para reportar problemas y mejoras.\n',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
