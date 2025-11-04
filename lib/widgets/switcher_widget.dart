import 'package:flutter/material.dart';

/// Se utiliza StatefulWidget porque necesitamos mantener y alternar el estado
/// _showFirst que controla qué imagen se muestra. Además, el widget necesita
/// recordar su estado actual para la animación de transición entre imágenes
class SwitcherDemo extends StatefulWidget {
  const SwitcherDemo({super.key});

  @override
  State<SwitcherDemo> createState() => _SwitcherDemoState();
}

class _SwitcherDemoState extends State<SwitcherDemo> {
  /// Controla qué imagen se muestra: true para la primera, false para la segunda
  bool _showFirst = true;

  /// Construye el widget con:
  /// - GestureDetector para detectar toques
  /// - AnimatedSwitcher para la transición animada entre imágenes
  /// - Contenedores con tamaño fijo para las imágenes
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() => _showFirst = !_showFirst),
        child: AnimatedSwitcher(
          /// Duración de la animación de transición
          duration: const Duration(milliseconds: 500),

          /// Constructor de la transición: usa una animación de escala
          transitionBuilder: (widget, animation) =>
              ScaleTransition(scale: animation, child: widget),
          child: _showFirst
              ? Container(
                  key: const ValueKey(1),
                  width: 150,
                  height: 150,
                  child: Image.network(
                    'https://s3.getstickerpack.com/storage/uploads/sticker-pack/shitpost-gifs/sticker_11.gif?e435dc30efb23e40bd62417271e319c9&d=200x200',
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  key: const ValueKey(2),
                  width: 150,
                  height: 150,
                  child: Image.network(
                    'https://media.tenor.com/cuov8Q1oUwYAAAAM/shitpost.gif',
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
