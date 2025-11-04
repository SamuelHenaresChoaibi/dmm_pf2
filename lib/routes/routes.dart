import 'package:flutter/material.dart';
import '/screens/home_page.dart';
import '/screens/personal_page.dart';
import '/screens/widget_page.dart';

/// Retorna un mapa con todas las rutas de la aplicación
/// - '/' : Pantalla principal (HomePage)
/// - '/personal' : Formulario de datos personales
/// - '/widget' : Demostración de widgets (Carousel y Switcher)
Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/': (context) => HomePage(),
    '/personal': (context) => PersonalPage(),
    '/widget': (context) => WidgetPage(),
  };
}