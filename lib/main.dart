import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const PF2());
}

class PF2 extends StatelessWidget {
  const PF2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
