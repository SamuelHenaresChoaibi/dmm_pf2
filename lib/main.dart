import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/personal_page.dart';
import 'screens/widget_page.dart';
import 'routes/routes.dart';

/// Punto de entrada principal de la aplicación
void main() {
  runApp(const PF2());
}

/// Widget raíz de la aplicación. Utiliza StatelessWidget porque solo
/// configura la navegación inicial y no necesita mantener ningún estado
class PF2 extends StatelessWidget {
  const PF2({super.key});

  /// Configura la aplicación con:
  /// - Banner de debug desactivado
  /// - Sistema de rutas para la navegación entre páginas
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        getAppRoutes().keys.first: (context) => HomePage(),
        getAppRoutes().keys.elementAt(1): (context) => PersonalPage(),
        getAppRoutes().keys.elementAt(2): (context) => WidgetPage(),
      },
    );
  }
}
