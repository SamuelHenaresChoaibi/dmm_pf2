import 'package:dmm_pf2/widgets/switcher_widget.dart';
import 'package:flutter/material.dart';
import 'package:dmm_pf2/widgets/carousel_view_widget.dart';

/// Se utiliza StatelessWidget porque esta página actúa como un contenedor
/// que solo muestra widgets (Carousel y Switcher) sin mantener estado propio.
/// La gestión del estado se delega a los widgets hijos que lo necesitan
class WidgetPage extends StatelessWidget {
  WidgetPage({super.key});

  /// Estilo de texto para la barra superior (más pequeño)
  final TextStyle _textStyleAppBar = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  /// Estilo de texto para los títulos de las secciones
  final TextStyle _textStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  /// Color principal para elementos interactivos y bordes
  final Color _screenPrimaryColor = Colors.deepPurple;

  /// Color de fondo oscuro para la pantalla
  final Color _backgroundColorScreen = Color.fromARGB(255, 53, 53, 53);

  /// Construye la interfaz que muestra los widgets de demostración
  /// organizados en una columna central
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAROUSEL / ANIMATED SWITCHER', style: _textStyleAppBar),
        backgroundColor: _screenPrimaryColor,
        centerTitle: true,
      ),
      backgroundColor: _backgroundColorScreen,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_widgetsColumn()],
        ),
      ),
    );
  }

  /// Organiza los widgets de demostración en una columna con espaciado
  Widget _widgetsColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _widgetCarousel(),
        SizedBox(height: 30),
        _widgetAnimatedSwitched(),
      ],
    );
  }

  /// Crea un contenedor decorado para el widget de carrusel de imágenes
  /// con borde redondeado y fondo semi-transparente
  Widget _widgetCarousel() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _screenPrimaryColor, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Carousel de Imágenes', style: _textStyle),
          const SizedBox(height: 10),
          const CarouselDemo(),
        ],
      ),
    );
  }

  /// Crea un contenedor decorado para el widget de cambio de imágenes
  /// con animación, usando el mismo estilo que el carrusel
  Widget _widgetAnimatedSwitched() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _screenPrimaryColor, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Animated Switcher', style: _textStyle),
          const SizedBox(height: 10),
          const SwitcherDemo(),
        ],
      ),
    );
  }
}
