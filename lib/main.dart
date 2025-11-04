import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/personal_page.dart';
import 'screens/widget_page.dart';
import 'routes/routes.dart';

void main() {
  runApp(const PF2());
}

class PF2 extends StatelessWidget {
  const PF2({super.key});

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
