import 'package:flutter/material.dart';
import '/screens/home_page.dart';
import '/screens/personal_page.dart';
import '/screens/widget_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/': (context) => HomePage(),
    '/personal': (context) => PersonalPage(),
    '/widget': (context) => WidgetPage(),
  };
}