import 'package:flutter/material.dart';

class ReportarErrorScreen extends StatelessWidget {
  ReportarErrorScreen({Key? key}) : super(key: key);

  final TextEditingController _errorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reportar Error'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '¿Qué ha pasado?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TextField(
                  controller: _errorController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Describe el error aquí...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final errorDescription = _errorController.text;
                  if (errorDescription.isNotEmpty) {
                    // Simulación de envío del error
                    bool envioExitoso = _enviarError(errorDescription);

                    if (envioExitoso) {
                      // Mostrar mensaje de éxito
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error reportado con éxito.'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      // Mostrar mensaje de error
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Disculpe, hubo un error. Vuelva a intentarlo más adelante.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ));
  }

  bool _enviarError(String errorDescription) {
    print('Error reportado: $errorDescription');
    return false;
  }
}
