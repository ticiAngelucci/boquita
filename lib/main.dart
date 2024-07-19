import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logger/logger.dart';
import 'package:bokita_app/ayudaScreen.dart';
import 'quienesSomosScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'San Juniors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light(primary: Colors.blueAccent),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: const MyHomePage(title: 'San Juniors'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _nextMatch =
      'Ingresa el nombre de tu equipo y toca el botón para ver los jugadores y su director técnico';
  bool _isLoading = false;

  Future<void> _fetchNextMatch(String team) async {
    setState(() {
      _isLoading = true;
      _nextMatch = 'Cargando...';
    });

    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: "AIzaSyCg-Bob5NvvLn7bp239OCJoMAqq8ZHRzTw",
      );
      final content = [
        Content.text(
          'Jugadores actuales de $team y su director técnico? En una lista, que diga posición, nombre y número de camiseta',
        ),
      ];
      final response = await model.generateContent(content);
      print("Respuesta del modelo: ${response.text}");

      setState(() {
        _nextMatch = response.text ?? 'Datos no disponibles';
      });

      Logger().i('Respuesta: ${response.text}');
    } catch (e) {
      Logger().e('Error: $e');
      setState(() {
        _nextMatch = 'Error al obtener datos';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://i.pinimg.com/564x/dc/c4/d3/dcc4d3cb52e97401ea9699c0a5d1f6e2.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Ingresa el nombre de tu equipo para ver los jugadores y su director técnico:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Nombre del equipo',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _fetchNextMatch(_controller.text);
                    },
                    child: const Text('Buscar'),
                  ),
                  const SizedBox(height: 16),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _nextMatch,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AyudaScreen()),
                );
              },
              child: const Text(
                'Ayuda',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuienesSomosScreen()),
                );
              },
              child: const Text(
                'Quiénes somos',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
