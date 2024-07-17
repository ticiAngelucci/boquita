import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagen de fondo
        Positioned.fill(
          child: Image.asset(
            'https://i.pinimg.com/564x/91/0a/0a/910a0ac6afe660229c422d0d8db7e99c.jpg',
            fit: BoxFit.cover,
          ),
        ),
        // Indicador de progreso en el centro
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
